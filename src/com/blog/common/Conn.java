package com.blog.common;
import java.sql.*;

//���ݿ�����
/**
 * 
 * @author ��
 *	JDBC�������ݿ�Ĳ��裺
 *	1. ע�Ტ������������	Class.forName() ��̬����������ָʾJava�������̬�Ĳ��ң����غ�����ָ���ࣨ�����δ���أ�
 *	2. ��������
 *	3. ����SQL������
 *	4. �ύSQL���
 *	5. ��ʾ���
 *	6. �ر����ӣ��ر�����ʱ����ȷ˳��Ӧ���ǣ�Result,Statement,Connection.
 */
public class Conn {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	/**
	 * ������������
	 */
	public Conn(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
		} catch (java.lang.ClassNotFoundException e){
			System.err.println(e.getMessage());
		}
	}
	/**
	 * ִ�в�ѯ������ select
	 */
	public ResultSet executeQuery(String sql){
		try{
			//��������
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogdb?userUnicode=true&characterEncoding=UTF-8","root",null);
			//����SQL������
			stmt = conn.createStatement();
			//�ύSQL���
			rs = stmt.executeQuery(sql);
		} catch(SQLException ex){
			System.err.println(ex.getMessage());
		}
		return rs;
	}
	/**
	 * ִ�и��²���
	 */
	public int executeUpdate(String sql){
		int result = 0;
		try{
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogdb?userUnicode=true&characterEncoding=UTF-8","root",null);
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql);
		} catch (SQLException ex){
			result = 0;
		}
		return result;
	}
	/**
	 * �ر����ݿ�����
	 */
	public void close(){
		try{
			if(rs != null){
				rs.close();
			} 
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(System.err);
		}
		try{
			if(stmt!=null){
				stmt.close();
			} 
		} catch(Exception e){
			e.printStackTrace(System.err);
		}
		try{
			if(conn!=null){
				stmt.close();
			} 
		} catch(Exception e){
			e.printStackTrace(System.err);
		}
	}
}
