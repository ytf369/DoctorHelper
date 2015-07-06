package com.doctorhelper.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.doctorhelper.entity.PageList;
import com.doctorhelper.entity.Post;
import com.doctorhelper.entity.User;
import com.doctorhelper.service.IPostService;
@Controller
@RequestMapping("/post")
public class PostController {
@Autowired
private IPostService postservice;
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
public String toPostList(HttpSession session,Model model,Integer pagenum,Integer size){
	List<Post> list = null;
	Long count = null;
	long rows;
	PageList pagerows=new PageList();
	User u=(User)session.getAttribute("user");
	if("0".equals(u.getRole())){
		//普通用户
		list=postservice.queryPublicPostandMine(pagenum, size, u.getId());
		count =postservice.queryPublicPostandMineCount(u.getId());
	}
	else{
		//后台医生
		list=postservice.quaryAllPost(pagenum, size);
		count=postservice.queryAllPostCount();
	}
	logger.info("查询的全部主题："+list);
	
	logger.info("查询的总记录数："+count);
	if(count%size>0){
		rows=count/size+1;
      }
	else{
		rows=count/size;
	}
	logger.info("共"+rows+"页");
	pagerows.setList(list);
	pagerows.setRows(rows);
	model.addAttribute("pagerows", pagerows);
	model.addAttribute("currentpage", pagenum);
	return "topicList";
}
@RequestMapping("/viewDetail.action")
public ModelAndView findPostDetail(long id){
	System.out.println("进入详情..");
	ModelAndView mv=new ModelAndView();
	Post p=postservice.findPostById(id);
	mv.addObject("mainpost", p);
	mv.setViewName("/WEB-INF/postpages/viewDetail");
	return mv;
}
}
