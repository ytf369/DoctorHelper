package com.doctorhelper.util;

public class PageUtil {
public  static Long getbeginPage(int currentPage,int pagelength){
	long num;
	long beginPage;
	//${((currentpage/4==0?currentpage/4:(currentpage/4)+1)*4)-3}
	if(currentPage%pagelength==0){
		num=(currentPage/pagelength);
	}
	else{
		num=(currentPage/pagelength)+1;
		
	}
	beginPage=(num*pagelength)-(pagelength-1);
	return beginPage;
}
public  static Long getendPage(Long rows,int currentPage,int pagelength){
	//
	Long endPage;
	if(getbeginPage(currentPage,pagelength)+(pagelength-1)>rows){
		endPage=rows;
	}
	else{
		endPage=getbeginPage(currentPage,pagelength)+(pagelength-1);
	}
	return endPage;
}

}
