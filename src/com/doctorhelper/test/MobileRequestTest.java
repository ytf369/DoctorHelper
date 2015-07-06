package com.doctorhelper.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doctorhelper.common.mobile.ClientOsInfo;
import com.doctorhelper.common.mobile.HeaderUtil;
import com.doctorhelper.common.mobile.MobileUtil;

public class MobileRequestTest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		    doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ClientOsInfo info=MobileUtil.getMobileOsInfo(req);
		String userAgent=info.getUserAgent();
		System.out.println("是移动设备吗？-->"+info.isMobile());
		System.out.println("是手机吗？-->"+HeaderUtil.isMobile(userAgent));
	}

}
