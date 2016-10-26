package com.blog.common;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Formatter;

import org.apache.taglibs.standard.lang.jstl.test.StaticFunctionTests;

/**
 * 数据转换类
 * @author 郝
 *
 */
public class DataConverter {
	public static String dataFm = "yyyy-MM--dd HH:mm:ss";
	/** 
	 * 将日期格式转化为字符串
	 * @param date
	 * @return 
	 * 
	 */
	public static String dataToString(Date date){
		//return dataToString(date,"yyyy-MM--dd HH:mm:ss");
		return dataToString(date,dataFm);
	}
	/**
	 * 将日期格式转化为字符串
	 * @param date-日期
	 * @param formatType-格式化方法
	 * @return-字符串
	 * 
	 */
	public static String dataToString(Date date, String formatType){
		if(date == null){
			date = Utility.getNowDateTime();
		}
		SimpleDateFormat formatter = new SimpleDateFormat(formatType);
		return formatter.format(date);
	}
	/**
	 * 将字符串转成日期（yyyy-MM-dd HH:mm:ss)
	 * @param input-日期字符串
	 * @return
	 */
	public static Date toDate(String input){
		return toDate(input,dataFm);
		//return toDate(input,"yyyy-MM-dd HH:mm:ss");
	}
	/**
	 * 将字符串转成日期
	 * @param formatType-格式化类型，如yyyy-MM-dd HH:mm:ss
	 * @return 日期类型，当出现异常时返回当前日期
	 */
	public static Date toDate(String input,String formatType){
		SimpleDateFormat format = new SimpleDateFormat(formatType);
		Date dt = new Date();
		if(DataValidator.isNullOrEmpty(input)){
			return dt;
		}
		try{
			dt = format.parse(input);
		} catch (ParseException e){
		}
		return dt;
	}
	/**
	 * 将字符串转成日期格式 yyyy-MM-dd
	 * @param input-日期字符串
	 * @return 日期类型，当出现异常时返回当前日期
	 */
	public static java.util.Date toShortDate(String input){
		//return toDate(input, "yyyy-MM-dd");
		return toDate(input,dataFm);
	}
	/**
	 * 将字符串转成短日期格式 yyyy-MM-dd HH:mm:ss
	 * @param input-日期字符串
	 * @return 日期类型，当出现异常时返回当前日期
	 */
	public static java.util.Date toFullDate(String input){
		//return toDate(input,"yyyy-MM-dd HH:mm:ss");
		return toDate(input,dataFm);
	}
	/**
	 * 将字符串转成整型
	 * @param input-要转换的字符串
	 * @retrun 整数,出现异常则返回
	 */
	public static int toInt(String input){
		try{
			return Integer.parseInt(input);
		}catch(Exception e){
			return 0;
		}
	}
	
}
