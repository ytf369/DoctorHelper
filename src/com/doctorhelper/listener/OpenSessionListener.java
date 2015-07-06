package com.doctorhelper.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class OpenSessionListener implements HttpSessionListener {

	//创建Session
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		System.out.println("新Session创建...");

	}

	//销毁session
	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		System.out.println("Session销毁...");
	}

}
