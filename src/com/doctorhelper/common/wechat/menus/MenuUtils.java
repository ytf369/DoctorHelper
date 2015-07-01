package com.doctorhelper.common.wechat.menus;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.client.methods.HttpPost;

import com.doctorhelper.util.AccesstokenUtil;
import com.doctorhelper.util.HttpUtils;

import net.sf.json.JSONObject;

public class MenuUtils {
public static void createMenu(){
	List<Button> blist=new ArrayList<Button>();
	Menu menu=new Menu();
	ViewButton b1=new ViewButton();
	b1.setName("心电图查询");
	b1.setType("view");
	b1.setUrl("http://doctorhelper.tunnel.mobi/DoctorHelper/test/index.html");
	blist.add(b1);
	ViewButton b2=new ViewButton();
	b2.setName("健康助手");
	b2.setType("view");
	b2.setUrl("http://doctorhelper.tunnel.mobi/DoctorHelper/index.jsp");
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
