package com.doctorhelper.common.mobile;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Pattern;
public class TimeHWUtil {
	/***
	 * yyyy-MM-dd HH:mm:ss
	 */
	public static final String yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss";
	public static final String YYYYMMDDHHMM = "yyyy-MM-dd HH:mm";
	public static final String YYYYMMDDHHMM_ZH = "yyyy年MM月dd HH点mm分";
	public static final String YYYYMMDDHHMMSS_ZH="yyyy年MM月dd日 HH点mm分ss秒";
	public static final String yyyyMMdd = "yyyy-MM-dd";

	private TimeHWUtil() {
		throw new Error("Don't let anyone instantiate this class.");
	}

	/***
	 * yyyy-MM-dd HH:mm:ss
	 * 
	 * @param timestamp
	 * @return
	 */
	public static String formatDateTime(Timestamp timestamp) {// format date
																// ,such as
		SimpleDateFormat sdf = new SimpleDateFormat(yyyyMMddHHmmss);
		String formatTimeStr = null;
		if(ValueWidget.isNullOrEmpty(timestamp)){
			/* 如果没有传参数timestamp，则默认为当前时间*/
			timestamp=new Timestamp(new Date().getTime());
		}
		if (timestamp != null) {
			formatTimeStr = sdf.format(timestamp);
		}
		return formatTimeStr;
	}

	/***
	 * yyyy-MM-dd HH:mm:ss
	 * 
	 * @param date
	 * @return
	 */
	public static String formatDateTime(Date date) {// format date ,such as
		SimpleDateFormat sdf = new SimpleDateFormat(yyyyMMddHHmmss);
		String formatTimeStr = null;
		if(ValueWidget.isNullOrEmpty(date)){
			/*若没有传递参数，则默认为当前时间*/
			date=new Date();
		}
		if (date != null) {
			formatTimeStr = sdf.format(date);
		}
		return formatTimeStr;
	}

	/***
	 * yyyy-MM-dd
	 * 
	 * @param timestamp
	 * @return
	 */
	public static String formatDate(Timestamp timestamp) {// format date ,such
															// as
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String formatTimeStr = null;
		if(ValueWidget.isNullOrEmpty(timestamp)){
			/* 如果没有传参数timestamp，则默认为当前时间*/
			timestamp=new Timestamp(new Date().getTime());
		}
		if (timestamp != null) {
			formatTimeStr = sdf.format(timestamp);
		}
		return formatTimeStr;
	}

	/***
	 * yyyy-MM-dd
	 * 
	 * @param date
	 * @return
	 */
	public static String formatDate(Date date) {// format date ,such as
		SimpleDateFormat sdf = new SimpleDateFormat(yyyyMMdd);
		String formatTimeStr = null;
		if(ValueWidget.isNullOrEmpty(date)){
			/*若没有传递参数，则默认为当前时间*/
			date=new Date();
		}
		if (date != null) {
			formatTimeStr = sdf.format(date);
		}
		return formatTimeStr;
	}

	public static String formatDateZh(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		String formatTimeStr = null;
		if(ValueWidget.isNullOrEmpty(date)){
			/*若没有传递参数，则默认为当前时间*/
			date=new Date();
		}
		if (date != null) {
			formatTimeStr = sdf.format(date);
		}
		return formatTimeStr;
	}

	public static String formatDateZh(Timestamp timestamp) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		String formatTimeStr = null;
		if(ValueWidget.isNullOrEmpty(timestamp)){
			/* 如果没有传参数timestamp，则默认为当前时间*/
			timestamp=new Timestamp(new Date().getTime());
		}
		if (timestamp != null) {
			formatTimeStr = sdf.format(timestamp);
		}
		return formatTimeStr;
	}

	/**
	 * 
	 * @param formatStr
	 *            format : yyyy-MM-dd HH:mm:ss
	 * @return
	 * @throws ParseException
	 */
	public static Timestamp getTimestamp4Str(String formatStr)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(yyyyMMddHHmmss);
		return new Timestamp(sdf.parse(formatStr).getTime());
	}

	/**
	 * 
	 * @param date
	 *            format : yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static Timestamp getTimestamp4Date(Date date) {
		if (date == null) {
			date = new Date();
		}
		return new Timestamp(date.getTime());
	}

	public static Date getDate4Str(String formatStr) throws ParseException {
		String format=null;
		if(formatStr.length()>10){
			format=yyyyMMddHHmmss;
		}else{
			format=yyyyMMdd;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.parse(formatStr);
	}

	/***
	 * format : yyyy年MM月dd日 HH点mm分ss秒
	 * 
	 * @param timestamp
	 * @return
	 */
	public static String formatTimestampZH(Timestamp timestamp) {
		if(ValueWidget.isNullOrEmpty(timestamp)){
			/* 如果没有传参数timestamp，则默认为当前时间*/
			timestamp=new Timestamp(new Date().getTime());
		}
		SimpleDateFormat sdf = new SimpleDateFormat(YYYYMMDDHHMMSS_ZH);
		return sdf.format(timestamp);
	}

	public static String formatDateTimeZH(Date date) {
		if(ValueWidget.isNullOrEmpty(date)){
			/*若没有传递参数，则默认为当前时间*/
			date=new Date();
		}
		SimpleDateFormat sdf = new SimpleDateFormat(YYYYMMDDHHMMSS_ZH);
		return sdf.format(date);
	}

	/**
	 * 比较是否过期 true：过期，不能正常使用 false：正常使用
	 * 
	 * @param timestamp
	 * @return
	 */
	public static boolean compareToTimestamp(Timestamp timestamp) {
		return timestamp.before(new java.util.Date());
	}

	/**
	 * 比较是否过期 true：过期，不能正常使用 false：正常使用
	 * 
	 * @param date
	 *            : java.util.Date
	 * @return
	 */
	public static boolean compareToDate(Date date) {
		return date.before(new java.util.Date());
	}

	public static Timestamp getTimestampAfter(Date d, int day) {
		Calendar now = Calendar.getInstance();
		now.setTime(d);
		now.set(Calendar.DATE, now.get(Calendar.DATE) + day);
		return new Timestamp(now.getTimeInMillis());
	}

	// public static java.util.Date getDateAfter(Date d, int day)
	// {
	// Calendar now = Calendar.getInstance();
	// now.setTime(d);
	// now.set(Calendar.DATE, now.get(Calendar.DATE) + day);
	// return now.getTime();
	// }

	public static Timestamp getTimestampBefore(Date d, int day) {
		Calendar now = Calendar.getInstance();
		now.setTime(d);
		now.set(Calendar.DATE, now.get(Calendar.DATE) - day);
		return new Timestamp(now.getTimeInMillis());
	}

	/***
	 * 
	 * @param d
	 *            :Base Date
	 * @param minutes
	 *            :Minutes delayed
	 * @return
	 */
	public static java.util.Date getDateAfterMinute(Date d, int minutes) {
		Calendar now = Calendar.getInstance();
		now.setTime(d);
		now.set(Calendar.MINUTE, now.get(Calendar.MINUTE) + minutes);
		return now.getTime();
	}
	/***
	 * 
	 * @param d : 基准日期
	 * @param day : 几天前
	 * @return
	 * @throws ParseException
	 */
	public static java.util.Date getDateBefore(String d, int day) throws ParseException {
		java.util.Date date=getDate4Str(d);
		return getDateBefore(date, day);
	}
	/***
	 * 
	 * @param d : 基准时间
	 * @param day : 几天前
	 * @return
	 */
	public static java.util.Date getDateBefore(Date d, int day) {
		Calendar now = Calendar.getInstance();
		now.setTime(d);
		now.set(Calendar.DATE, now.get(Calendar.DATE) - day);
		return now.getTime();
	}
	/***
	 * 
	 * @param second : 秒
	 * @return
	 */
	public static java.util.Date getDateBySecond(long second){
		Date date=new Date(second*1000);
		return date;
	}
	/***
	 * 返回秒(不是毫秒)
	 * @param d
	 * @param day
	 * @return
	 */
	public static long getSecondBefore(Date d, int day) {
		return getDateBefore(d, day).getTime()/1000;
	}
	/***
	 * 
	 * @param d : 基准时间
	 * @param day
	 * @return
	 * @throws ParseException
	 */
	public static long getSecondBefore(String d, int day) throws ParseException {
		java.util.Date date=getDate4Str(d);
		return getDateBefore(date, day).getTime()/1000;
	}

	public static java.util.Date getDateBeforeMinute(Date d, int minutes) {
		Calendar now = Calendar.getInstance();
		now.setTime(d);
		now.set(Calendar.DATE, now.get(Calendar.MINUTE) - minutes);
		return now.getTime();
	}

	/**
	 * get current datetime
	 * 
	 * @return
	 */
	public static Timestamp getCurrentTimestamp() {
		return new Timestamp(System.currentTimeMillis());
	}
	/***
	 * 
	 * @return : 当前时间的毫秒数
	 */
	public static long getCurrentTimeLong(){
		return new Date().getTime();
	}
	/***
	 * 
	 * @return : 当前时间的秒数
	 */
	public static long getCurrentTimeInt(Date date){
		if(ValueWidget.isNullOrEmpty(date)){
			date=new Date();
		}
		return date.getTime()/1000;
	}
	public static long getCurrentTimeInt(){
		return getCurrentTimeInt(null);
	}
	/***
	 * Get current sql data
	 * @return
	 */
	public static java.sql.Date getCurrentSQLDate(){
		return new java.sql.Date(System.currentTimeMillis());
	}

	public static Calendar getCalendar() {
		Calendar c = Calendar.getInstance();
		return c;
	}

	public static Calendar getCalendar(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c;
	}

	/***
	 * _yy_MM_dd_HH_mm_ss_
	 * 
	 * @param date
	 * @return
	 */
	public static String formatTimestamp2(Date date) {// format date ,such as
		SimpleDateFormat sdf = new SimpleDateFormat("_yy_MM_dd_HH_mm_ss_");
		String formatTimeStr = null;
		if (date != null) {
			formatTimeStr = sdf.format(date);
		}
		return formatTimeStr;
	}

	/***
	 * 
	 * @param d
	 *            :Base Date
	 * @param day
	 *            :Delayed days
	 * @return
	 */
	public static java.util.Date getDateAfter(Date d, int day) {
		Calendar now = Calendar.getInstance();
		now.setTime(d);
		now.set(Calendar.DATE, now.get(Calendar.DATE) + day);
		return now.getTime();
	}

	/**
	 * 
	 * Determine whether date is valid, including the case of a leap year
	 * 
	 * @param date
	 *            YYYY-mm-dd
	 * @return
	 */
	public static boolean isDate(String date) {
		StringBuffer reg = new StringBuffer(
				"^((\\d{2}(([02468][048])|([13579][26]))-?((((0?");
		reg.append("[13578])|(1[02]))-?((0?[1-9])|([1-2][0-9])|(3[01])))");
		reg.append("|(((0?[469])|(11))-?((0?[1-9])|([1-2][0-9])|(30)))|");
		reg.append("(0?2-?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][12");
		reg.append("35679])|([13579][01345789]))-?((((0?[13578])|(1[02]))");
		reg.append("-?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))");
		reg.append("-?((0?[1-9])|([1-2][0-9])|(30)))|(0?2-?((0?[");
		reg.append("1-9])|(1[0-9])|(2[0-8]))))))");
		Pattern p = Pattern.compile(reg.toString());
		return p.matcher(date).matches();
	}

	/***
	 * format Date
	 * 
	 * @param date
	 * @param formatString
	 * @return
	 */
	public static String formatDate(Date date, String formatString) {
		try {
			SimpleDateFormat format = new SimpleDateFormat(formatString);
			return format.format(date);
		} catch (Exception ex) {
			return "";
		}
	}

	public static String formatTimestamp_noSecond(Timestamp timestamp) {// format
		// date
		// ,such
		// as
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String formatTimeStr = null;
		if (timestamp != null) {
			formatTimeStr = sdf.format(timestamp);
		}
		return formatTimeStr;
	}

	public static String formatTimestampShortStr(Timestamp timestamp) {// format
		// date
		// ,such
		// as
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String formatTimeStr = null;
		if (timestamp != null) {
			formatTimeStr = sdf.format(timestamp);
		}
		return formatTimeStr;
	}

	public static String formatDateShortZh(Timestamp timestamp) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		String formatTimeStr = null;
		if (timestamp != null) {
			formatTimeStr = sdf.format(timestamp);
		}
		return formatTimeStr;
	}

	public static String formatDateShortZh(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		String formatTimeStr = null;
		if (date != null) {
			formatTimeStr = sdf.format(date);
		}
		return formatTimeStr;
	}

	/***
	 * "yyyy-MM-dd"
	 * @param date
	 * @return
	 */
	public static String formatDateShortEN(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String formatTimeStr = null;
		if (date != null) {
			formatTimeStr = sdf.format(date);
		}
		return formatTimeStr;
	}

	public static String formatDateZhAll(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		String formatTimeStr = null;
		if (date != null) {
			formatTimeStr = sdf.format(date);
		}
		return formatTimeStr;
	}
	
	public static String getMiniuteSecond(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("mm:ss");
		String formatTimeStr = null;
		if (date != null) {
			formatTimeStr = sdf.format(date);
		}
		return formatTimeStr;
	}
	public static String getMiniuteSecondZH(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("mm分ss秒");
		String formatTimeStr = null;
		if (date != null) {
			formatTimeStr = sdf.format(date);
		}
		return formatTimeStr;
	}
	public static String getCurrentMiniuteSecond() {
		Date date=new Date();
		return getMiniuteSecond(date);
	}
	public static String getCurrentMiniuteSecondZH() {
		Date date=new Date();
		return getMiniuteSecondZH(date);
	}
	/***
	 * 
	 * @param date
	 * @param dateFormat : e.g:yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String formatDateByPattern(Date date,String dateFormat){
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
		String formatTimeStr = null;
		if (date != null) {
			formatTimeStr = sdf.format(date);
		}
		return formatTimeStr;
	}
	/***
	 * 
	 * @param dateStr
	 * @param dateFormat
	 * @return
	 */
	public static Date parseDateByPattern(String dateStr,String dateFormat){
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
		try {
			return sdf.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	/***
	 * convert Date to cron ,eg.  "0 06 10 15 1 ? 2014"
	 * @param date  : 时间点
	 * @return
	 */
	public static String getCron(java.util.Date  date){
		String dateFormat="ss mm HH dd MM ? yyyy";
		return formatDateByPattern(date, dateFormat);
	}
	/***
	 * 两个日期相差多少秒
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static int getTimeDelta(Date date1,Date date2){
		long timeDelta=(date1.getTime()-date2.getTime())/1000;//单位是秒
		int secondsDelta=timeDelta>0?(int)timeDelta:(int)Math.abs(timeDelta);
		return secondsDelta;
	}
	
	/***
	 * 两个日期相差多少秒
	 * @param dateStr1  :yyyy-MM-dd HH:mm:ss
	 * @param dateStr2 :yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static int getTimeDelta(String dateStr1,String dateStr2){
		Date date1=parseDateByPattern(dateStr1, yyyyMMddHHmmss);
		Date date2=parseDateByPattern(dateStr2, yyyyMMddHHmmss);
		return getTimeDelta(date1, date2);
	}
	/***
	 * 两个日期相差多少秒
	 * @param dateStr1
	 * @param date2
	 * @return
	 */
	public static int getTimeDelta(String dateStr1,Date date2){
		Date date1=parseDateByPattern(dateStr1, yyyyMMddHHmmss);
		return getTimeDelta(date1, date2);
	}
	/***
	 * convert "2014-05-30T19:00:00" to "2014-05-30 19:00:00"
	 * @param input
	 * @return
	 */
	public static String formatJsonDate(String input){
		String result=input.replaceAll("([\\d]{4}-[\\d]{1,2}-[\\d]{1,2})[ \tTt]([\\d]{1,2}:[\\d]{1,2}:[\\d]{1,2})", "$1 $2");
		return result;
	}
	/***
	 * 转换日期,把秒转换为日期
	 * @param time
	 * @return
	 */
	public static String formatSecondTime(Long time){
		if(time==null||time==0){
			return SystemHWUtil.EMPTY;
		}
		Date date=new Date(time*1000);
		return TimeHWUtil.formatDate(date, TimeHWUtil.YYYYMMDDHHMM);
		
	}
}
