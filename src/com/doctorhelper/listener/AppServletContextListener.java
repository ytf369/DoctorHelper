package com.doctorhelper.listener;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

import com.doctorhelper.util.AccesstokenUtil;

public class AppServletContextListener implements
		ServletContextListener {
	private static Logger logger = Logger.getLogger(AppServletContextListener.class);


	/*
	 * 销毁监听
	 * (non-Javadoc)
	 * @see javax.servlet.ServletContextListener#contextDestroyed(javax.servlet.ServletContextEvent)
	 */
	@Override
	public void contextDestroyed(ServletContextEvent even) {
		logger.info("服务停止...");
		
	}

	/*
	 * 启动监听
	 * (non-Javadoc)
	 * @see javax.servlet.ServletContextListener#contextInitialized(javax.servlet.ServletContextEvent)
	 */
	@Override
	public void contextInitialized(final ServletContextEvent even) {
		even.getServletContext().setAttribute("ctx", even.getServletContext().getContextPath());
		logger.info("服务已启动...");
        Runnable runnable = new Runnable() {  
	          public void run() {  
	        	getaccesstoken(even);
	            }  
	        };  
	           ScheduledExecutorService service = Executors  
	                 .newSingleThreadScheduledExecutor();  
	       // 第二个参数为首次执行的延时时间，第三个参数为定时执行的间隔时间  
	        service.scheduleAtFixedRate(runnable, 0, 3600, TimeUnit.SECONDS);
		
	}
	public void getaccesstoken (ServletContextEvent even){
		String AccessToken=AccesstokenUtil.getAccesstoken();
        even.getServletContext().setAttribute("AccessToken", AccessToken);
	}
}
