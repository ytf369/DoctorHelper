package com.doctorhelper.common.wechat.menus;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.client.methods.HttpPost;

import com.doctorhelper.util.AccesstokenUtil;
import com.doctorhelper.util.HttpUtils;
import com.doctorhelper.util.PropUtil;

import net.sf.json.JSONObject;

public class MenuUtils {
public static void createMenu(){
	List<Button> blist=new ArrayList<Button>();
	Menu menu=new Menu();
//	ViewButton b1=new ViewButton();
//	b1.setName("心电图查询");
//	b1.setType("view");
//	b1.setUrl("http://doctorhelper.tunnel.mobi/DoctorHelper/test/index.html");
//	blist.add(b1);
	ViewButton b2=new ViewButton();
	b2.setName("健康助手");
	b2.setType("view");
	//http://doctorhelper.tunnel.mobi/DoctorHelper/index.jsp
	b2.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+PropUtil.getValue("appid")+
			  "&redirect_uri=http%3a%2f%2fdoctorhelper.tunnel.mobi%2fDoctorHelper%2fuser%2fentermain.action&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");
	blist.add(b2);
	menu.setButton(blist);
	JSONObject json=JSONObject.fromObject(menu);
	System.out.println(json.toString());
	String url="https://api.weixin.qq.com/cgi-bin/menu/create?access_token="+AccesstokenUtil.getAccesstoken();
	try {
		String resu=HttpUtils.doPost(url, json.toString(), "utf-8");
		System.out.println("resu="+resu);
	} catch (Exception e) {
		e.printStackTrace();
	}
}
public static void main(String[] args) {
	createMenu();
}
}
