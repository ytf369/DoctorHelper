package com.doctorhelper.common.wechat.util;

import net.sf.json.JSONObject;

import com.doctorhelper.util.HttpUtils;
import com.doctorhelper.util.PropUtil;

public class WeChatUtil {

	/**
	 * 授权获取用户信息
	 * @return
	 */
	public static String getAuthedUserInfo(String code ){
		//通过code换取网页授权access_token
		String url="https://api.weixin.qq.com/sns/oauth2/access_token?"
				+ "appid="+PropUtil.getValue("appid")
				+ "&secret="+PropUtil.getValue("secret")
				+ "&code="+code
				+ "&grant_type=authorization_code";
		String accesstokenJson=HttpUtils.doGet(url, null);
		System.out.println("accesstokenJson="+accesstokenJson);
		JSONObject jsonObj=JSONObject.fromObject(accesstokenJson);
		String access_token=jsonObj.getString("access_token");
		String openid=jsonObj.getString("openid");
		//拉取用户信息
		String url2="https://api.weixin.qq.com/sns/userinfo?"
				+ "access_token="+access_token
				+ "&openid="+openid
				+ "&lang=zh_CN";
		String userinfo=HttpUtils.doGet(url2, null);
		return userinfo;
	}
}
