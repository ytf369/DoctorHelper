package com.doctorhelper.listener;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;

import org.apache.log4j.Logger;

public class AppServletContextListener implements
		ServletContextAttributeListener {
	private static Logger logger = Logger.getLogger(AppServletContextListener.class);
	/**
	 * 启动监听
	 */
	@Override
	public void attributeAdded(ServletContextAttributeEvent arg0) {
           logger.info("服务已启动...");
	}

	/**
	 * 销毁监听
	 */
	@Override
	public void attributeRemoved(ServletContextAttributeEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void attributeReplaced(ServletContextAttributeEvent arg0) {
		// TODO Auto-generated method stub

	}

}
