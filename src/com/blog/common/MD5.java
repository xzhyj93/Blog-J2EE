package com.blog.common;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
	private static MessageDigest digest = null;
	/**
	 * 加密类，此方法默认为16位加密
	 * @param data
	 * @return 
	 */
	public synchronized static final String Encrypt(String data){
		return Encrypt(data, 16);
	}
	/**
	 * 加密类，此方法可以手动设置加密位数
	 * @param data
	 * @param len
	 * @return 
	 */
	public synchronized static final String Encrypt(String data, int len){
		if(digest==null){
			try{
				digest = MessageDigest.getInstance("MD5");
			}catch(NoSuchAlgorithmException e){
				e.printStackTrace();
			}
		}
		if(len != 16 && len != 32)
			len = 16;
		try{
			digest.update(data.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e){
		}
		String s = encodeHex(digest.digest());
		if(len == 16){
			return s.substring(8,24);
		}
		return s;
	}
	private static final String encodeHex(byte[] bytes){
		int i;
		StringBuffer buf = new StringBuffer(bytes.length*2);
		for(i=0;i<bytes.length;i++){
			if(((int) bytes[i]&0xff)<0x10){
				buf.append("0");
			}
			buf.append(Long.toString((int) bytes[i]&0xff,16));
		}
		return buf.toString();
	}
}
