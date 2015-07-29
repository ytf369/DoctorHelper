package com.doctorhelper.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.doctorhelper.entity.Attempt;
import com.doctorhelper.entity.Department;
import com.doctorhelper.entity.Message;
import com.doctorhelper.entity.PageList;
import com.doctorhelper.entity.Post;
import com.doctorhelper.entity.User;
import com.doctorhelper.service.IDeptService;
import com.doctorhelper.service.IPostService;
import com.doctorhelper.util.CommonDateParseUtil;
import com.doctorhelper.util.PageUtil;
import com.doctorhelper.util.PropUtil;
@Controller
@RequestMapping("/post")
public class PostController {
@Autowired
private IPostService postservice;
@Autowired
private IDeptService deptservice;
private static Logger logger = Logger.getLogger(PostController.class);
/**
 * 分页查询发帖
 * @param session
 * @param model
 * @param pagenum
 * @param size
 * @return
 */
@RequestMapping("/toPostList.action")
public String toPostList(HttpSession session,Model model,Integer pagenum,Integer size,String lately){
	
	List<Post> list = null;
	Long count = null;
	long rows;
	PageList pagerows=new PageList();
	User u=(User)session.getAttribute("user");
	if(u==null){
		return "/WEB-INF/error/noaccessRole";
	}
	if("0".equals(u.getRole())||u.getRole()==null){
		//普通用户
		//查询刚更新的
		if(!"".equals(lately)&&lately!=null){
			//session存入当前时间
			if(session.getAttribute("begintime")==null){
			session.setAttribute("begintime", CommonDateParseUtil.date2string(new Date(), CommonDateParseUtil.YYYY_MM_DD_HH_MM_SS));
			}
			querylatelyPostsByDate(session,u);
		}
		list=postservice.queryPublicPostandMine(pagenum, size, u.getId());
		count =postservice.queryPublicPostandMineCount(u.getId());
		if(count%size>0){
			rows=count/size+1;
	      }
		else{
			rows=count/size;
		}
		Long beginPage=PageUtil.getbeginPage(pagenum, 4);
		Long endPage=PageUtil.getendPage(rows, pagenum, 4);
		logger.info("共"+rows+"页;起始页："+beginPage+";结束页："+endPage);
		pagerows.setList(list);
		pagerows.setRows(rows);
		model.addAttribute("pagerows", pagerows);
		model.addAttribute("currentpage", pagenum);
		model.addAttribute("poststate", "toPostList");
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		return "/WEB-INF/postpages/userprivatelist";
	}
	else{
		//后台医生
		if("0".equals(u.getChicked())){
			//未审核
			return "/WEB-INF/error/isuncheckedRole";
		}
		
		//未回复的话题
		 list=postservice.querynoreplyPost(pagenum, size);
		//最近更新的已回复的话题
		//List<Post> list2=postservice.queryhasreplyPost(pagenum, size);
		count=postservice.querynoreplyCount();
	
	logger.info("查询的主题："+list);
	logger.info("查询的记录数："+count);
	if(count%size>0){
		rows=count/size+1;
      }
	else{
		rows=count/size;
	}
	Long beginPage=PageUtil.getbeginPage(pagenum, 4);
	Long endPage=PageUtil.getendPage(rows, pagenum, 4);
	logger.info("共"+rows+"页");
	pagerows.setList(list);
	pagerows.setRows(rows);
	model.addAttribute("pagerows", pagerows);
	model.addAttribute("currentpage", pagenum);
	model.addAttribute("beginPage", beginPage);
	model.addAttribute("endPage", endPage);
	model.addAttribute("poststate", "toPostList");
	return "topicList";
	}
}
/**
 * 查看主题详情
 * @param id
 * @return
 */
@RequestMapping("/viewDetail.action")
public ModelAndView findPostDetail(long id){
	ModelAndView mv=new ModelAndView();
	Post p=postservice.findPostById(id);
	mv.addObject("mainpost", p);
	mv.setViewName("/WEB-INF/postpages/viewDetail");
	return mv;
}
/**
 * 发表我的主题
 * @return
 */
@RequestMapping("/publishMyPost.action")
public String publishMyPost(Model model){
	List<Department> depts=deptservice.queryAllDept();
	model.addAttribute("depts", depts);
	return "/WEB-INF/postpages/ask";
}
/**
 * 保存我的问题
 * @return
 */
@ResponseBody
@RequestMapping("/savePost.action")
public Message savePost(HttpServletRequest request,HttpSession session,Post p) {
	System.out.println("公开："+p.getIspublic());
	if("on".equals(p.getIspublic())){
		p.setIspublic("1");
	}
	else{
		p.setIspublic("0");
	}
	User u=(User) session.getAttribute("user");
	System.out.println("标题："+p.getTitle());
	p.setUser(u);
	p.setCreatetime(new Date());
	p.setUpdatetime(new Date());
	handleFormUpload(request,p);
	return postservice.savePost(p);
}
/**
 * 查询最近跟新的已回复的话题
 * @param model
 * @param pagenum
 * @param size
 * @return
 */
@RequestMapping("/lastyUpdatePost.action")
public String lastyUpdatePost(Model model,Integer pagenum,Integer size){
	List<Post> list = null;
	Long count = null;
	long rows;
	PageList pagerows=new PageList();
 
		//最近更新的已回复的话题
		 list=postservice.queryhasreplyPost(pagenum, size);
		count=postservice.queryhasreplyCount();
	if(count%size>0){
		rows=count/size+1;
      }
	else{
		rows=count/size;
	}
	Long beginPage=PageUtil.getbeginPage(pagenum, 4);
	Long endPage=PageUtil.getendPage(rows, pagenum, 4);
	model.addAttribute("beginPage", beginPage);
	model.addAttribute("endPage", endPage);
	logger.info("共"+rows+"页");
	pagerows.setList(list);
	pagerows.setRows(rows);
	model.addAttribute("pagerows", pagerows);
	model.addAttribute("currentpage", pagenum);
	model.addAttribute("poststate", "lastyUpdatePost");
	return "topicList";
}
/**
 * 查询我回复的话题
 * @param model
 * @param pagenum
 * @param size
 * @return
 */
@RequestMapping("/postsWithMyreply.action")
public String postsWithMyreply(HttpSession session,Model model,Integer pagenum,Integer size){
	List<Post> list = null;
	Long count = null;
	long rows;
	PageList pagerows=new PageList();
    User u=(User) session.getAttribute("user");
		//我回复的
		 list=postservice.queryPostWithMyReply(u, pagenum, size);
		count=postservice.queryPostWithMyReplyCount(u);
	if(count%size>0){
		rows=count/size+1;
      }
	else{
		rows=count/size;
	}
	Long beginPage=PageUtil.getbeginPage(pagenum, 4);
	Long endPage=PageUtil.getendPage(rows, pagenum, 4);
	model.addAttribute("beginPage", beginPage);
	model.addAttribute("endPage", endPage);
	logger.info("共"+rows+"页");
	pagerows.setList(list);
	pagerows.setRows(rows);
	model.addAttribute("pagerows", pagerows);
	model.addAttribute("currentpage", pagenum);
	model.addAttribute("poststate", "postsWithMyreply");
	return "topicList";
}
/**
 * 查询我的发帖
 * @param session
 * @param model
 * @param pagenum
 * @param size
 * @return
 */
@RequestMapping("/myposts.action")
public String myposts(HttpSession session,Model model,Integer pagenum,Integer size){
	List<Post> list = null;
	Long count = null;
	long rows;
	PageList pagerows=new PageList();
    User u=(User) session.getAttribute("user");
		//最近更新的已回复的话题
		 list=postservice.querymyPosts(u, pagenum, size);
		count=postservice.querymyPostsCount(u);
	if(count%size>0){
		rows=count/size+1;
      }
	else{
		rows=count/size;
	}
	Long beginPage=PageUtil.getbeginPage(pagenum, 4);
	Long endPage=PageUtil.getendPage(rows, pagenum, 4);
	model.addAttribute("beginPage", beginPage);
	model.addAttribute("endPage", endPage);
	logger.info("共"+rows+"页");
	pagerows.setList(list);
	pagerows.setRows(rows);
	model.addAttribute("pagerows", pagerows);
	model.addAttribute("currentpage", pagenum);
	model.addAttribute("poststate", "myposts");
	return "/WEB-INF/postpages/userprivatelist";
}
//公用方法**********************************************
/**
 * 上传图片
 * @param request
 * @return
 */
public void handleFormUpload(HttpServletRequest request,Post p){    
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
	  p.setAttepmts(apts);
	 } 
		/**
		 * 用户调用：查询时间段内更新的数据
		 * @param session
		 */
		public void querylatelyPostsByDate(HttpSession session,User u){
			System.out.println("上次更新当前时间："+(String) session.getAttribute("begintime"));
			String begintime=(String) session.getAttribute("begintime");
			//List<Post> latelypublicposts=postservice.querylatelypublicposts(begintime);//查询时间段内最近更新
			Integer latelypublicpostsCount=postservice.querylatelypublicpostsCount(u,begintime);
			System.out.println("刚更新数："+latelypublicpostsCount);
			//List<Post> mylatelypost=postservice.querymylatelypost();//查询时间段内回复我的
			Long mylatelypostCount=postservice.querymylatelypostCount(u,begintime);
			System.out.println("刚回复我数："+mylatelypostCount);
			//更新当前时间
			session.setAttribute("latelypublicpostsCount", latelypublicpostsCount);
			session.setAttribute("mylatelypostCount", mylatelypostCount);
			session.setAttribute("begintime", CommonDateParseUtil.date2string(new Date(), CommonDateParseUtil.YYYY_MM_DD_HH_MM_SS));
		}
		}
