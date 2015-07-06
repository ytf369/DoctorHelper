package com.doctorhelper.common.mobile;

import javax.servlet.http.HttpServletRequest;

public class MobileUtil {
	/*** 
	 * 当移动端(手机或Pad)访问网页时获取移动端操作系统信息 
	 * @param request 
	 * @return 
	 */  
	public static ClientOsInfo getMobileOsInfo(HttpServletRequest request){  
	    String userAgent=request.getHeader("user-agent");  
	    if(ValueWidget.isNullOrEmpty(userAgent)){  
	        userAgent=request.getHeader("User-Agent");  
	    }  
	    ClientOsInfo info= HeaderUtil.getMobilOS(userAgent);  
	    info.setUserAgent(userAgent);  
	    return info;  
	}  
}
