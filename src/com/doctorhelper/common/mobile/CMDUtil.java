package com.doctorhelper.common.mobile;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

public class CMDUtil {
	private static final String filePathshort = "c:" + File.separator + "test";
	private static final String filename = "a.txt";
	private static final String filePath_name = filePathshort + File.separator
			+ filename;
	
	static {
		File file = new File(filePathshort);
		if (!file.isDirectory()) {
			try {
				file.mkdirs();
				File file2 = new File(filePath_name);
				if (!file2.exists()) {
					file2.createNewFile();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
 public static Process executeCmd(String command)
    {
        Process p = null;
        try
        {
            p = Runtime.getRuntime().exec(SystemHWUtil.CMD_SHORT + command);
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return p;
    }

    public static BufferedReader cmdCmdreReader(String command,String charset)
    {
    	if(ValueWidget.isNullOrEmpty(charset)){
    		charset=SystemHWUtil.CURR_ENCODING;
    	}
        Process p = null;
        BufferedReader reader = null;
        try
        {
            String command2=SystemHWUtil.CMD_SHORT + command;
            p = Runtime.getRuntime().exec(command2);
            System.out.println(command2);
            reader = new BufferedReader(new InputStreamReader(p.getInputStream(),charset));
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return reader;
    }
	

	public static String cmdCmdreStr(String command,String charset) 
{
		BufferedReader reader = cmdCmdreReader(command,charset);
		return FileUtils.getFullContent(reader);
	}

	/**
	 *  Unicode -->\u4e2d\u56fd
	 * 
	 * @param nativeStr
	 * @return
	 */
	/*
	 * public static String native2Unicode(String nativeStr){
	 * FileUtils.writeToFile(filePath_name, nativeStr); return
	 * cmdCmdreStr("native2ascii "+filePath_name); }
	 */
	public static String toUnicode(String str) {
		StringBuffer result = new StringBuffer();
		for (int i = 0; i < str.length(); i++) {
			int chr1 = (char) str.charAt(i);
			result.append("\\u" + Integer.toHexString(chr1));

		}
		return result.toString();
	}

	/**
	 *  Unicode  \u4e2d\u56fd-->
	 * <br>要执行操作系统本地命令
	 * @param nativeStr
	 * @return
	 */
	public static String unicode2Native(String nativeStr) {
		FileUtils.writeToFile(filePath_name, nativeStr);
		return cmdCmdreStr("native2ascii -reverse " + filePath_name,null);
	}

	public static String resolveUnicode(String fileContent, boolean isToUnicode) {
		if (!isToUnicode) {
			return unicode2Native(fileContent);
		} else {
			return toUnicode(fileContent);
		}
	}
	public static String getResult4cmd(String cmd){
		return getResult4cmd(cmd, null);
	}
	public static String getResult4cmd(String cmd,String charset){
		if(ValueWidget.isNullOrEmpty(charset)){
			charset=SystemHWUtil.CURR_ENCODING;
		}
		BufferedReader reader =CMDUtil.cmdCmdreReader(cmd,charset);
    	String content=FileUtils.getFullContent(reader);
    	return content;
	}
	public static void main(String[] args) {
//		String filePath="e:\\test\\a.txt";
		String filePath="e:\\Java\\jdk\\jdk-6u27-windows-x64.exe";
		String content=CMDUtil.getResult4cmd("dir "+filePath,SystemHWUtil.CURR_ENCODING);
		System.out.println(content);
	}

	public static String execute(String[]command,String cmdFolder,String charset){
		 BufferedReader reader = null;
		 Process p = null;
		 String errorInputStr = null;
	        try
	        {
//	        	String commandFolder=;
	        	if(ValueWidget.isNullOrEmpty(charset)){
	        		charset=SystemHWUtil.CURR_ENCODING;
	        	}
	        	if(ValueWidget.isNullOrEmpty(cmdFolder)){
	        		p = Runtime.getRuntime().exec(command);
	        	}else{
	        		p = Runtime.getRuntime().exec(command, null,new File(cmdFolder/*命令的所在目录*/));//)
	        	}
	            reader = new BufferedReader(new InputStreamReader(p
	                    .getInputStream(),charset));
	            errorInputStr=FileUtils.getFullContent4(p.getErrorStream(),charset);
	            if(!ValueWidget.isNullOrEmpty(errorInputStr)){
	            	System.out.println("error:"+errorInputStr);
	            }
	            StringBuilder sb = new StringBuilder();
	            String readedLine = null;
	            try
	            {
	                while ((readedLine = reader.readLine()) != null)
	                {
	                    sb.append(readedLine);
	                    sb.append("\r\n");
	                }
	            }
	            catch (IOException e)
	            {
	                e.printStackTrace();
	            }
	            finally
	            {
	                try
	                {
	                    reader.close();
	                    p.destroy();
	                }
	                catch (IOException e)
	                {
	                    e.printStackTrace();
	                }
	            }
	            String content = sb.toString();
	            System.out.println(content);
	        }
	        catch (IOException e)
	        {
	            e.printStackTrace();
	        }
	        return errorInputStr;
	}
	/***
	 * 仅适用于windows 系统,会调用本地命令<br>
	 * hide:attrib ".mqtt_client.properties" +H<br>
	 * show:attrib ".mqtt_client.properties" -H
	 * @param filePath
	 * @return
	 */
	public static int hide(String filePath){
		if(new File(filePath).exists()){
			Process p=CMDUtil.executeCmd("attrib "+filePath+" +H");
			try {
				p.waitFor();
			} catch (InterruptedException e) {
				e.printStackTrace();
				return SystemHWUtil.NEGATIVE_ONE;
			}
			return p.exitValue();
		}else{
			return SystemHWUtil.NEGATIVE_ONE;
		}
		
	}
	
	/***
	 * 仅适用于windows 系统,会调用本地命令<br>
	 * hide:attrib ".mqtt_client.properties" +H<br>
	 * show:attrib ".mqtt_client.properties" -H
	 * @param filePath
	 * @return
	 */
	public static int show(String filePath){
		if(new File(filePath).exists()){
			Process p=CMDUtil.executeCmd("attrib "+filePath+" -H");
			try {
				p.waitFor();
			} catch (InterruptedException e) {
				e.printStackTrace();
				return SystemHWUtil.NEGATIVE_ONE;
			}
			return p.exitValue();
		}else{
			return SystemHWUtil.NEGATIVE_ONE;
		}
	}
	/***
	 * 设置为只读
	 * @param filePath
	 * @return
	 */
	public static int readOnly(String filePath){
		if(new File(filePath).exists()){
			Process p=CMDUtil.executeCmd("attrib "+filePath+" +R");
			try {
				p.waitFor();
			} catch (InterruptedException e) {
				e.printStackTrace();
				return SystemHWUtil.NEGATIVE_ONE;
			}
			return p.exitValue();
		}else{
			return SystemHWUtil.NEGATIVE_ONE;
		}
	}
	
	/***
	 * 设置为可写
	 * @param filePath
	 * @return
	 */
	public static int removeReadOnly(String filePath){
		if(new File(filePath).exists()){
			Process p=CMDUtil.executeCmd("attrib "+filePath+" -R");
			try {
				p.waitFor();
			} catch (InterruptedException e) {
				e.printStackTrace();
				return SystemHWUtil.NEGATIVE_ONE;
			}
			return p.exitValue();
		}else{
			return SystemHWUtil.NEGATIVE_ONE;
		}
	}
	
}
