package com.doctorhelper.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doctorhelper.common.wechat.util.WeChatUtil;
import com.doctorhelper.entity.Message;
import com.doctorhelper.entity.PageList;
import com.doctorhelper.entity.User;
import com.doctorhelper.service.IUserService;
import com.doctorhelper.util.PageUtil;

    @Controller
    @RequestMapping("/user")
public class UserController {
    @Autowired
	private IUserService userservice;
    
	private static Logger logger = Logger.getLogger(UserController.class);

    /**
     * 咨询入口
     * @param session
     * @return
     * @throws UnsupportedEncodingException 
     */
    @RequestMapping("/entermain.action")
    public String entermain(HttpSession session,String code,String state,Model model,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		System.out.println("客户端真实IP："+getIpAddr(request));
		//用户微信授权
    	if(code!=null&&!"".equals(code)){
    		System.out.println("CODE：="+code+"*****STATE:="+state+"*****SESSIONID：="+session.getId());
    		System.out.println(getIpAddr(request));
    		//查询个人信息
    		String userinfoJson=WeChatUtil.getAuthedUserInfo(code);
    		logger.info("获得授权的个人信息："+userinfoJson);
    		JSONObject jsonObj=JSONObject.fromObject(userinfoJson);
    		//根据openid获取用户
    		User u=userservice.findUserByOpenId(jsonObj.getString("openid"));
    		if(u==null){
    			u=new User();
    		}
    			u.setName(jsonObj.getString("nickname"));
    			u.setCity(jsonObj.getString("city"));
    			u.setCountry(jsonObj.getString("country"));
    			u.setHeadpicurl(jsonObj.getString("headimgurl"));
    			u.setOpenid(jsonObj.getString("openid"));
    			u.setSex(jsonObj.getString("sex"));
    			//u.setUnionid(jsonObj.getString("unionid"));
    			u.setPrivilege(jsonObj.getString("privilege"));
    			userservice.saveorupdateUser(u);
    			session.setAttribute("user", u);
    			//保存用户姓名，社区到cookie
    			String realname_url=URLEncoder.encode(u.getRealname(),"utf-8");
        		String community_url=URLEncoder.encode(u.getCommunity(),"utf-8");
    			Cookie cookie = new Cookie("cookie_user",realname_url +"|"+community_url);
    			response.addCookie(cookie);
    			model.addAttribute("isAuthed", true);
    		}
    	
    	else{
    		if(session==null||(User)session.getAttribute("user")==null){
    		model.addAttribute("isAuthed", false);
    		System.out.println("微信账号未授权或未登录...");
    		}
    		else{
    		model.addAttribute("isAuthed", true);	
    		System.out.println("已授权已登录...");
    		}
    	}
    	return "index";
    }
    /**
     * 绑定新用户
     * @param session
     * @param u
     * @return
     */
    @RequestMapping("/bind.action")
    public String binduser(HttpSession session,User user){
    	
    	if(session==null||session.getAttribute("user")==null){
    		//返回重新授权页面
    		return "/WEB-INF/error/invalidation";
    	}
    	else{
        User u=(User) session.getAttribute("user");
        if(u.getRole()=="0"){
        	u.setChicked("1");
        }
        else{
        	//专家医生需审核
        	u.setChicked("0");
        }
        u.setIsbinded(true);
        u.setPassword(u.getPassword());
        u.setBirthday(user.getBirthday());
        u.setCommunity(user.getCommunity());
        u.setIdcard(user.getIdcard());
        u.setPhone(user.getPhone());
        u.setRealname(user.getRealname());
    	userservice.saveorupdateUser(u);
    	return "login";
    	}
    }
    /**
     * 用户登陆
     * @param session
     * @param u
     * @return
     * @throws UnsupportedEncodingException 
     */
    @RequestMapping("/login.action")
    public String login(HttpSession session,User user,HttpServletResponse response,Model model) throws UnsupportedEncodingException{
    	User u=userservice.findUserbynmAndpwd(user.getLoginname(), user.getPassword());
    	if(u!=null){
    		if("admin".equals(u.getRole())){
    			//管理员
    			session.setAttribute("admin", u);
    			logger.info("管理员进入...");
    			return "redirect:/user/queryallexperts.action?pagenum=1&size=10";
    		}
    		if("0".equals(u.getChicked())){
    			//未通过审核
    			model.addAttribute("loginstatus", "3");
    	    	return "login";
    		}
    		else{
    		session.setAttribute("user", u);
    		//保存用户姓名，社区到cookie
    		String realname_url=URLEncoder.encode(u.getRealname(),"utf-8");
    		String community_url=URLEncoder.encode(u.getCommunity(),"utf-8");
			Cookie cookie = new Cookie("cookie_user",realname_url+ "|"+community_url);
			cookie.setPath("/");
			response.addCookie(cookie);
    		return "redirect:/post/toPostList.action?pagenum=1&size=4";
    		}
    	}
    	else{
    		model.addAttribute("loginstatus", 0);
    	return "login";
    	}
    }
    /**
     * 用户退出
     * @param session
     * @return
     */
    @RequestMapping("/logout.action")
    public String logout(HttpSession session){
    	if(session.getAttribute("user")!=null){
    		session.removeAttribute("user");
    	}
    	if(session.getAttribute("admin")!=null){
    		session.removeAttribute("admin");
    	}
    	return "login";
    }
    /**
     * 跳转到咨询列表页
     * @return
     */
    @RequestMapping("/toTopicList")
    public String toTopicList(HttpSession session,HttpServletRequest request){
    	System.out.println("客户端真实IP："+getIpAddr(request));
    	return "topicList";
    }
    
       /**
        * 获得客户端真实IP
        * @param request
        * @return
        */
        public String getIpAddr(HttpServletRequest request) { 
        	 String ip = request.getHeader("x-forwarded-for"); 
        	 if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
        		 ip = request.getHeader("Proxy-Client-IP"); 
        	 }
        	 if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
        		 ip = request.getHeader("WL-Proxy-Client-IP"); 
        	 }
        	 if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
        		 ip = request.getRemoteAddr(); 
        	 }
        	 return ip;
        	 }
      /**
       * 查看个人信息  
       * @param session
       * @param model
       * @return
       */
      @RequestMapping("/findUserinfo.action")
      public String findUserinfo(HttpSession session,Model model){
    	  return "/WEB-INF/user/userInfo";
      }
      /**
       * 验证用户名是否重复
       * @param name
       * @return
       */
      @ResponseBody
      @RequestMapping("/checkUsernameIsused.action")
      public Message checkUsernameIsused(String name){
    	  Message mg=new Message();
    	  User u=userservice.findUserByname(name);
    	  if(u!=null){
    		  mg.setCode(0);
    		  mg.setText("used");
    		  return mg;
    	  }
    	  else{
    	  mg.setCode(1);
    	  mg.setText("unused");
    	  return mg;
    	  }
      }
      /**
       * 分页查询所有专家医生
       * @param model
       * @return
       */
      @RequestMapping("/queryallexperts.action")
      public String queryallexperts(int pagenum,int size,Model model){
    	  long rows;
    	  PageList pagerows=new PageList();
    	  List<User> users=userservice.queryallByrole(pagenum,size,"1");
    	  Long  count =userservice.querycountByrole("1");
    	  if(count%size>0){
  			rows=count/size+1;
  	      }
  		else{
  			rows=count/size;
  		}
        Long beginPage=PageUtil.getbeginPage(pagenum, 10);
  		Long endPage=PageUtil.getendPage(rows, pagenum, 10);
    	pagerows.setList(users);
  		pagerows.setRows(rows);
  		model.addAttribute("pagerows", pagerows);
  		model.addAttribute("currentpage", pagenum);
  		model.addAttribute("menu","expertsMenu");
  		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
    	  return "/WEB-INF/manager/index";
      }
      /**
       * 更改用户审核状态
       * @param id
       * @param checked
       * @return
       */
      @ResponseBody
      @RequestMapping("/updateUserchecked.action")
      public Message updateUserchecked(Long id,String checked){
    	  System.out.println(id+"||"+checked);
    	  Message mg=new Message();
    	  try {
    		  userservice.updateUserChecksta(id, checked);
    		  mg.setCode(1);
    		  mg.setText("success");
		} catch (Exception e) {
			e.printStackTrace();
			mg.setCode(0);
			mg.setText("failed");
		}
    	  return mg;
      }
      /**
       * 跳转到修改密码页
       * @return
       */
      @RequestMapping("/toMidifyPwd.action")
      public String toMidifyPwd(){
    	  return "/WEB-INF/user/modifypwd";
      }
      /**
       * 验证旧密码是否正确
       * @param session
       * @param oldpwd
       * @return
       */
      @ResponseBody
      @RequestMapping("/checkOldpwd.action")
     public Message checkOldpwd(HttpSession session,String oldpwd,String mark){
    	  User u;
    	  Message mg=new Message();
    	  if(mark==null||"".equals(mark)){
    	    u=(User)session.getAttribute("user");
    	  }
    	  else{
    		  u=(User)session.getAttribute("admin");
    	  }
    	 if(oldpwd.equals(u.getPassword())){
    		 mg.setCode(1);
    		 mg.setText("旧密码匹配");
    	 }
    	 else{
    		 mg.setCode(0);
    		 mg.setText("旧密码不正确");
    	 }
    	 return mg;
     }
      /**
       * 修改密码
       * @param session
       * @param newpwd
       * @return
       */
      @ResponseBody
      @RequestMapping("/modifyPwd.action")
      public Message modifyPwd(HttpSession session,String newpwd,String mark){
    	  Message mg=new Message();
    	  User u;
    	  if(mark==null||"".equals(mark)){
      	    u=(User)session.getAttribute("user");
      	  }
      	  else{
      		u=(User)session.getAttribute("admin");
      	  }
    	  try {
    		  userservice.updateUserpwd(u.getId(), newpwd);
    		  mg.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			mg.setCode(0);
		}
    	  return mg;
      }
}
