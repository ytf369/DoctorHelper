package com.doctorhelper.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import com.doctorhelper.common.wechat.util.WeChatUtil;
import com.doctorhelper.entity.Message;
import com.doctorhelper.entity.User;
import com.doctorhelper.service.IUserService;
import com.doctorhelper.servlet.WechatServlet;

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
     */
    @RequestMapping("/entermain.action")
    public String entermain(HttpSession session,String code,String state,Model model,HttpServletRequest request){
		System.out.println("客户端真实IP："+getIpAddr(request));
		//用户微信授权
    	if(code!=null&&!"".equals(code)){
    		System.out.println("CODE：="+code+"*****STATE:="+state+"*****SESSIONID：="+session.getId());
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
    public String binduser(HttpSession session,String name,String password){
    	
    	if(session==null||session.getAttribute("user")==null){
    		//返回重新授权页面
    		return "/WEB-INF/error/invalidation";
    	}
    	else{
        User u=(User) session.getAttribute("user");
        u.setIsbinded(true);
        u.setLoginname(name);
        u.setPassword(password);
    	userservice.saveorupdateUser(u);
    	return "login";
    	}
    }
    /**
     * 用户登陆
     * @param session
     * @param u
     * @return
     */
    @RequestMapping("/login.action")
    public String login(HttpSession session,User user,Model model){
    	User u=userservice.findUserbynmAndpwd(user.getLoginname(), user.getPassword());
    	if(u!=null){
    		session.setAttribute("user", u);
    		return "redirect:/post/toPostList.action?pagenum=1&size=4";
    	}
    	else{
    		model.addAttribute("loginstatus", 0);
    	return "login";
    	}
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

}
