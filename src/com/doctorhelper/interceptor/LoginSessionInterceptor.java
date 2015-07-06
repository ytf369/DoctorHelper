package com.doctorhelper.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.doctorhelper.common.mobile.HeaderUtil;
import com.doctorhelper.common.mobile.MobileUtil;
import com.doctorhelper.controller.PostController;
import com.doctorhelper.entity.User;
import com.doctorhelper.util.PropUtil;
/**
 * 登陆拦截器
 * @author HP
 *
 */
public class LoginSessionInterceptor implements HandlerInterceptor{
	private static Logger logger = Logger.getLogger(LoginSessionInterceptor.class);

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
	
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2, ModelAndView arg3) throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		logger.info("进入拦截器....");
		if(request.getSession()==null||request.getSession().getAttribute("user")==null){
//			System.out.println("session过期");
//			if(HeaderUtil.isMobile(MobileUtil.getMobileOsInfo(request).getUserAgent())){
//				response.sendRedirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+PropUtil.getValue("appid")+
//						  "&redirect_uri=http%3a%2f%2fdoctorhelper.tunnel.mobi%2fDoctorHelper%2fuser%2fentermain.action&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");
//				return false;
//			}
//			else{
//				response.sendRedirect("https://open.weixin.qq.com/connect/qrconnect?appid="+PropUtil.getValue("appid")+
//						 "&redirect_uri=http%3a%2f%2fdoctorhelper.tunnel.mobi%2fDoctorHelper%2fuser%2fentermain.action&response_type=code&scope=snsapi_login&state=3d6be0a4035d839573b04816624a415e#wechat_redirect");
//				return false;
//			}
			response.sendRedirect("http://doctorhelper.tunnel.mobi/DoctorHelper/login.jsp");
			return false;
       }  
		else{
			return true;
		}
		}
  
}