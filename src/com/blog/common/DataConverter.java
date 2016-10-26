package com.blog.common;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Formatter;

import org.apache.taglibs.standard.lang.jstl.test.StaticFunctionTests;

/**
 * ����ת����
 * @author ��
 *
 */
public class DataConverter {
	public static String dataFm = "yyyy-MM--dd HH:mm:ss";
	/** 
	 * �����ڸ�ʽת��Ϊ�ַ���
	 * @param date
	 * @return 
	 * 
	 */
	public static String dataToString(Date date){
		//return dataToString(date,"yyyy-MM--dd HH:mm:ss");
		return dataToString(date,dataFm);
	}
	/**
	 * �����ڸ�ʽת��Ϊ�ַ���
	 * @param date-����
	 * @param formatType-��ʽ������
	 * @return-�ַ���
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
	 * ���ַ���ת�����ڣ�yyyy-MM-dd HH:mm:ss)
	 * @param input-�����ַ���
	 * @return
	 */
	public static Date toDate(String input){
		return toDate(input,dataFm);
		//return toDate(input,"yyyy-MM-dd HH:mm:ss");
	}
	/**
	 * ���ַ���ת������
	 * @param formatType-��ʽ�����ͣ���yyyy-MM-dd HH:mm:ss
	 * @return �������ͣ��������쳣ʱ���ص�ǰ����
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
	 * ���ַ���ת�����ڸ�ʽ yyyy-MM-dd
	 * @param input-�����ַ���
	 * @return �������ͣ��������쳣ʱ���ص�ǰ����
	 */
	public static java.util.Date toShortDate(String input){
		//return toDate(input, "yyyy-MM-dd");
		return toDate(input,dataFm);
	}
	/**
	 * ���ַ���ת�ɶ����ڸ�ʽ yyyy-MM-dd HH:mm:ss
	 * @param input-�����ַ���
	 * @return �������ͣ��������쳣ʱ���ص�ǰ����
	 */
	public static java.util.Date toFullDate(String input){
		//return toDate(input,"yyyy-MM-dd HH:mm:ss");
		return toDate(input,dataFm);
	}
	/**
	 * ���ַ���ת������
	 * @param input-Ҫת�����ַ���
	 * @retrun ����,�����쳣�򷵻�
	 */
	public static int toInt(String input){
		try{
			return Integer.parseInt(input);
		}catch(Exception e){
			return 0;
		}
	}
	
}
