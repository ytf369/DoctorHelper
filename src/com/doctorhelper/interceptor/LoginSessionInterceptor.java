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
		String hostname=PropUtil.getValue("host");
		logger.info("进入拦截器....");
		if(request.getSession()==null){
			response.sendRedirect(hostname+"/DoctorHelper/login.jsp");
			return false;
       }  
		else{
			if(request.getSession().getAttribute("user")==null&&request.getSession().getAttribute("admin")==null){
				response.sendRedirect(hostname+"/DoctorHelper/login.jsp");
				return false;
		     }
			else{
			return true;	
			}
			}
		}
  
}