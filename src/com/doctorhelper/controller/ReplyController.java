package com.doctorhelper.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.doctorhelper.entity.Attempt;
import com.doctorhelper.entity.Message;
import com.doctorhelper.entity.Post;
import com.doctorhelper.entity.Reply;
import com.doctorhelper.entity.User;
import com.doctorhelper.service.IPostService;
import com.doctorhelper.service.IReplySevice;
import com.doctorhelper.util.PropUtil;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	private IReplySevice replyservice;
	@Autowired
	private IPostService postservice;
	private static Logger logger = Logger.getLogger(ReplyController.class);
	/**
	 * 对主题帖的回复
	 * @param session
	 * @param reply
	 * @param postid
	 * @return
	 */
	@RequestMapping("/sendMyReply.action")
	@ResponseBody
	public Message sendMyReply(HttpSession session,Reply reply,long postid,HttpServletRequest request){
		System.out.println("要回复的postId"+postid);
		Message mg=new Message();
		try {
			User u=(User) session.getAttribute("user");
			Post p=postservice.findPostById(postid);
			if("0".equals(u.getRole())){
				p.setUpdatetime(new Date());
				postservice.updatePostupdatetime(p);
			}
			reply.setPost(p);
			reply.setCreatetime(new Date());
			reply.setUser(u);
			//保存图片
			handleFormUpload(request,reply);
			replyservice.saveReply(reply);
			mg.setCode(1);
			mg.setText("success");
		} catch (Exception e) {
			e.printStackTrace();
			mg.setText("falied");
		}
		return mg;
	}
	/**
	 * 对回复的回复页
	 * @param replyid
	 * @return
	 */
	@RequestMapping("/toreplypage.action")
	public String toreplypage(Long replyid,Model model){
		Reply reply=replyservice.getReplyByid(replyid);
		model.addAttribute("reply", reply);
		return "replystoreply";
	}
	/**
	 *  发送对回复的回复
	 * @param session
	 * @param replyid
	 * @param reply
	 * @return
	 */
	@RequestMapping("/sendMyReplyToReply.action")
	@ResponseBody
	public Message sendMyReplyToReply(HttpSession session,long replyid,Reply reply){
		System.out.println("要回复的replyID"+replyid);
		Message mg=new Message();
		try {
			User u=(User) session.getAttribute("user");
			Reply r=replyservice.getReplyByid(replyid);
			reply.setParentreply(r);
			reply.setCreatetime(new Date());
			reply.setUser(u);
			replyservice.saveReply(reply);
			mg.setCode(1);
			mg.setText("success");
		} catch (Exception e) {
			e.printStackTrace();
			mg.setText("falied");
		}
		return mg;
	}
	/**
	 * 上传图片
	 * @param request
	 * @return
	 */
	public void handleFormUpload(HttpServletRequest request,Reply r){    
		MultipartHttpServletRequest multipartRequest  =  (MultipartHttpServletRequest) request;  
		  List<MultipartFile> file = multipartRequest.getFiles("imgfile");  
		  Set<Attempt> apts=new  HashSet<Attempt>();
		  String path = request.getSession().getServletContext().getRealPath("../attempt/"); // 获取本地存储路径  
		  System.out.println(file.size()+"个文件");  
		  FileOutputStream fileOutputStream = null;  
		  for (int i = 0; i < file.size(); i++) {  
		   if (!file.get(i).isEmpty()) {
			   Attempt apt=new Attempt();
		    String fileName =  file.get(i).getOriginalFilename();  
		    String a = fileName.split("\\.")[1];  
		    String filesavename=new Date().getTime()+i+"."+a;
		    File files = new File( path+"/"+filesavename); // 新建一个文件  
		    try {  
		     fileOutputStream = new FileOutputStream(files);  
		     fileOutputStream.write(file.get(i).getBytes());  
		     System.out.println("原文件名===="+file.get(i).getOriginalFilename());  
		     System.out.println("类型===="+file.get(i).getContentType());  
		     fileOutputStream.flush();  
		     apt.setFilename(file.get(i).getOriginalFilename());
		     apt.setFilesavePath(path+"/"+filesavename);
		     apt.setFileurl(PropUtil.getValue("imguploadpath")+filesavename);
		     apts.add(apt);
		    } catch (Exception e) {  
		     e.printStackTrace();  
		    }  
		    if (fileOutputStream != null) { // 关闭流  
		     try {  
		      fileOutputStream.close();  
		     } catch (IOException ie) {  
		      ie.printStackTrace();  
		     }  
		    }  
		   }  
		  }  
		  r.setAttepmts(apts);
		 } 
}
