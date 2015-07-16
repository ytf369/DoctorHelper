package com.doctorhelper.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doctorhelper.entity.Message;
import com.doctorhelper.entity.Post;
import com.doctorhelper.entity.Reply;
import com.doctorhelper.entity.User;
import com.doctorhelper.service.IPostService;
import com.doctorhelper.service.IReplySevice;

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
	public Message sendMyReply(HttpSession session,Reply reply,long postid){
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
}
