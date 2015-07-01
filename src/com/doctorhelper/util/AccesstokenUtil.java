package com.doctorhelper.util;

import net.sf.json.JSON;
import net.sf.json.JSONObject;
import net.sf.json.JSONString;
import net.sf.json.util.JSONUtils;

import org.apache.log4j.Logger;

import com.doctorhelper.listener.AppServletContextListener;
import com.fasterxml.jackson.core.JsonParser;

public class AccesstokenUtil {
	private static Logger logger = Logger.getLogger(AppServletContextListener.class);
	public static String getAccesstoken(){
		String appid=PropUtil.getValue("appid");
		String secret=PropUtil.getValue("secret");
		logger.info("appid="+appid);
		logger.info("secret="+secret);
		String url="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+appid+"&secret="+secret;
        String result= HttpUtils.doGet(url, null);
        JSONObject json=JSONObject.fromObject(result);
        String accesstokenValue=json.getString("access_token");
        logger.info("ACCESSTOKEN="+accesstokenValue);
		return accesstokenValue;
	}
}
