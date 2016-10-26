package com.blog.common;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

/**
 * ����
 * @author ��
 *
 */
public class Utility {
	/**
	 * ��ȡ�ַ���
	 * @param input
	 * @param len
	 * @return 
	 */
	public static String subsstring(String input, int len){
		if(DataValidator.isNullOrEmpty(input))
			return "";
		if(len>=input.length())
			return input;
		return input.substring(0,len);
	}
	/**
	 * ��ȡ��ǰʱ��
	 * @return 
	 */
	public static Date getNowDateTime(){
		Calendar cal = Calendar.getInstance();
		String now = cal.get(Calendar.YEAR)+"-"
				+ (cal.get(Calendar.MONTH)+1) + '-' + cal.get(Calendar.DATE)
				+" " + cal.get(Calendar.HOUR) + ":" + cal.get(Calendar.MINUTE)
				+":"+cal.get(Calendar.SECOND);
		return DataConverter.toDate(now,"yyyy-MM-dd HH:mm:ss");
	}
	/**
	 * ��õ�ǰ����
	 * @return 
	 */
	public static Date getNowDate(){
		Calendar cal = Calendar.getInstance();
		String now = cal.get(Calendar.YEAR)+"-"
				+ (cal.get(Calendar.MONTH)+1) + '-' + cal.get(Calendar.DATE);
		return DataConverter.toDate(now,"yyyy-MM-dd HH:mm:ss");
	}
	/**
	 * д��cookie
	 * @param response
	 * @param key
	 * @return value
	 * 
	 */
	public static void writeCookie(HttpServletResponse response, String key, String value){
		writeCookie(response, key, value, -1);
	}
	/**
	 * д��cookie
	 * @param response
	 * @param key
	 * @param value
	 * @param expirse
	 */
	public static void writeCookie(HttpServletResponse response, String key, String value, int expirse){
		Cookie newCookie = new Cookie(key, value);
		if(expirse>0){
			expirse = expirse*60;
		}
		newCookie.setPath("/");
		newCookie.setMaxAge(expirse);
		response.addCookie(newCookie);
	}
	/**
	 * ��ȡcookieֵ
	 * @param request
	 * @param key
	 * @return 
	 */
	public static String readCookie(HttpServletRequest request,String key){
		String value = "";
		Cookie[] ck = request.getCookies();
		if(ck == null)
			return "";
		for(Cookie c:ck){
			if(c.getName().equals(key)){
				value = c.getValue();
				break;
			}
		}
		return value;
	}
	
}
