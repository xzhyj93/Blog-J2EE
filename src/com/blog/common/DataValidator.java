package com.blog.common;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * ������֤��
 * @author ��
 *
 */
public class DataValidator {
	/**
	 * ��֤�ַ����Ƿ�Ϊ�� = ""�� = null
	 * @param input-��Ҫ��֤���ַ���
	 * @return true/false
	 */
	public static boolean isNullOrEmpty(String input){
		return "".equals(input)||input==null;
	}
	/**
	 * ƥ��������ʽ
	 * @param input-��Ҫ����ƥ����ַ���
	 * @param pattern-������ʽ
	 * @param true/false
	 */
	public static boolean regexMatch(String input, String pattern){
		if(isNullOrEmpty(input)){
			return false;
		}
		return Pattern.compile(pattern).matcher(input).matches();
	}
	/**
	 * ƥ������
	 * @param input
	 * @return
	 */
	public static boolean isEmail(String input){
		String pattern = "\\w+@\\w+(\\.\\w{2,3})*\\.\\w{2,3}";
		return regexMatch(input, pattern);
	}
	/**
	 * HTML���룬֧�ֻ��з�
	 * @param input-��Ҫ������ַ���
	 * @return �������ַ���
	 */
	public static String htmlEncode(String input){
		if(!DataValidator.isNullOrEmpty(input)){
			input = input.replace("&", "&amp;");
			input = input.replace("<", "&lt;");
			input = input.replace(">", "&gt;");
			input = input.replace("'", "&#39;");
			input = input.replace("\"", "&quot;");
			input = input.replace("\r\n", "<br>;");
			input = input.replace("\n", "<br>;");
		}
		return input;
	}
	/**
	 * html�����룬֧�ֻ��з�
	 * @param input-��Ҫ��������ַ���
	 * @return ����ǰ��ԭʼ�ַ���
	 */
	public static String htmlDecode(String input){
		if(!DataValidator.isNullOrEmpty(input)){
			input = input.replace("<br>", "\n");
			input = input.replace("&gt;", ">");
			input = input.replace("&lt;", "<");
			input = input.replace("&#39;", "'");
			input = input.replace("&quot;", "\"");
			input = input.replace("&amp;", "&");
		}
		return input;
	}
	/**
	 * HTML���룬��֧�ֻ��з�
	 * @param input-��Ҫ������ַ���
	 * @return �������ַ���
	 */
	public static String serverHtmlEncode(String input){
		if(!DataValidator.isNullOrEmpty(input))
			return input;
		input = input.replace("&", "&amp;");
		input = input.replace("<", "&lt;");
		input = input.replace(">", "&gt;");
		input = input.replace("'", "&#39;");
		input = input.replace("\"", "&quot;");
		return input;
	}
	/**
	 * html�����룬��֧�ֻ��з�
	 * @param input-��Ҫ��������ַ���
	 * @return ����ǰ��ԭʼ�ַ���
	 */
	public static String serverHtmlDecode(String input){
		if(!DataValidator.isNullOrEmpty(input))
			return input;
		input = input.replace("&gt;", ">");
		input = input.replace("&lt;", "<");
		input = input.replace("&#39;", "'");
		input = input.replace("&quot;", "\"");
		input = input.replace("&amp;", "&");

		return input;
	}
	/**
	 * ��������html����
	 * @param input-��Ҫ���˵��ַ���
	 * @return ���˺���ַ���
	 */
	public static String removeHtml(String input){
		if(DataValidator.isNullOrEmpty(input))
			return input;
		Pattern p = Pattern.compile("<[^>]*>",Pattern.MULTILINE | Pattern.UNICODE_CASE);
		Matcher m = p.matcher(input);
		return m.replaceAll("");
	}
	
	
}
