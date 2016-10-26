package com.blog.common;
import java.sql.*;

//数据库连接
/**
 * 
 * @author 郝
 *	JDBC访问数据库的步骤：
 *	1. 注册并加载驱动程序	Class.forName() 静态方法，用于指示Java虚拟机动态的查找，加载和连接指定类（如果尚未加载）
 *	2. 创建连接
 *	3. 创建SQL语句对象
 *	4. 提交SQL语句
 *	5. 显示结果
 *	6. 关闭连接：关闭连接时，正确顺序应该是：Result,Statement,Connection.
 */
public class Conn {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	/**
	 * 加载驱动程序
	 */
	public Conn(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
		} catch (java.lang.ClassNotFoundException e){
			System.err.println(e.getMessage());
		}
	}
	/**
	 * 执行查询操作： select
	 */
	public ResultSet executeQuery(String sql){
		try{
			//创建连接
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogdb?userUnicode=true&characterEncoding=UTF-8","root",null);
			//创建SQL语句对象
			stmt = conn.createStatement();
			//提交SQL语句
			rs = stmt.executeQuery(sql);
		} catch(SQLException ex){
			System.err.println(ex.getMessage());
		}
		return rs;
	}
	/**
	 * 执行更新操作
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
	 * 关闭数据库连接
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
