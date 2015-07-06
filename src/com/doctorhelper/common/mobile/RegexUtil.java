package com.doctorhelper.common.mobile;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexUtil {
	/***
	 * 
	 * @param a
	 * @param aa
	 * @param index : 初始值为0
	 */
	protected static List<StringBuffer> cc(String[][] aa,int index,List<StringBuffer> list,boolean isDealRegex){
		
		if(index>=aa.length){//说明已经遍历完成
			return list;//并不是每次循环都会执行,最后才会执行此语句.
		}
		String cc[]=aa[index];
		int length=cc.length;
		List<StringBuffer> listNew=new ArrayList<StringBuffer>();
		if(list==null||list.size()==0){//首次循环
			for(int i=0;i<length;i++){//必须保证顺序,所以不能使用 foreach
				if(isDealRegex && cc[i].equals("*")){
					cc[i]="\\*";
				}
//				if(isDealRegex){
//					listNew.add(new StringBuffer(cc[i]+"?"));
//				}else{
					listNew.add(new StringBuffer(cc[i]));
//				}
				
			}
		}else{
			for(int i=0;i<length;i++){//必须保证顺序,所以不能使用 foreach
				for(int j=0;j<list.size();j++){//必须保证顺序,所以不能使用 foreach
					StringBuffer sb=list.get(j);
					StringBuffer sb2=new StringBuffer(sb);
					if(isDealRegex && cc[i].equals("*")){
						cc[i]="\\*";
					}
//					if(isDealRegex  ){
//						sb2.append(cc[i]+"?");
//					}else{
						sb2.append(cc[i]);
//					}
					listNew.add(sb2);
				}
			}
		}
		List<StringBuffer> list33=cc(aa, ++index, listNew,isDealRegex);
		if(!ValueWidget.isNullOrEmpty(list33)){
			return list33;
		}
		return null;
	}
	/***
	 * 修改C:\Windows\System32\drivers\etc\hosts,删除注释#
	 * @param content
	 * @param domain
	 * @return
	 */
	public static String deleteComment(String content,String domain){
		String regex="[ ]*#[\\s]*(127.0.0.1[\\s]*"+domain+")";
		 Pattern p=Pattern.compile(regex);
	        Matcher m=p.matcher(content);
	        StringBuffer sb = new StringBuffer();
	        boolean result=m.find();
	        if(!result){
	        	return null;
	        }
	        while(result){
	            String str=m.group(1);
	            m.appendReplacement(sb, str);
	            result=m.find();
	        }
	        
	        m.appendTail(sb);
	        return sb.toString();
	}
	/***
	 * 修改C:\Windows\System32\drivers\etc\hosts,增加注释#
	 * @param content
	 * @param domain
	 * @return
	 */
	public static String addComment(String content,String domain){
		String regex="[ ]*127.0.0.1[\\s]*"+domain;
		 Pattern p=Pattern.compile(regex);
	        Matcher m=p.matcher(content);
	        StringBuffer sb = new StringBuffer();
	        boolean result=m.find();
	        while(result){
	            String str=m.group();
	            m.appendReplacement(sb, "# "+str);
	            result=m.find();
	        }
	        m.appendTail(sb);
	        return sb.toString();
	}
}
