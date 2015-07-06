package com.doctorhelper.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.dom4j.DocumentException;

import com.doctorhelper.listener.AppServletContextListener;
import com.doctorhelper.util.MessageUtil;
import com.doctorhelper.util.WechatCheckUtil;
/**
 * 微信
 * @author HP
 *
 */
public class WechatServlet extends HttpServlet {
	/**
	 * 接入验证
	 */
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(WechatServlet.class);

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String signature = req.getParameter("signature");
		String timestamp = req.getParameter("timestamp");
		String nonce = req.getParameter("nonce");
		String echostr = req.getParameter("echostr");
		
		PrintWriter out = resp.getWriter();
		if(WechatCheckUtil.checkSignature(signature, timestamp, nonce)){
			out.print(echostr);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		
		try {
			Map<String, String> map = MessageUtil.xmlToMap(req);
			String fromUserName = map.get("FromUserName");
			String toUserName = map.get("ToUserName");
			String msgType = map.get("MsgType");
			String content = map.get("Content");
			String event = map.get("Event");
			String url=map.get("EventKey");
			logger.info("Message信息：发件人："+fromUserName+"消息类型："+"事件"+event);
			//推送事件
			if(MessageUtil.MESSAGE_EVNET.equals(msgType)){
				String neturl="http://doctorhelper.tunnel.mobi/DoctorHelper/index.jsp"
						+ "";
				if(MessageUtil.MESSAGE_VIEW.equals(event) && neturl.equals(url)) {
					logger.info("进入健康助手首页..."+req.getSession().getId());
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
