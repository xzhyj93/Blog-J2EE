package com.blog.dal;
import java.net.PasswordAuthentication;
import java.security.interfaces.RSAKey;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.blog.common.Conn;
import com.blog.common.DataValidator;
import com.blog.common.MD5;
import com.blog.model.BlogInfo;
import com.blog.model.UsersInfo;

public class Users {
	Conn conn = new Conn();
	/**
	 * 获取用户列表
	 * @return 
	 * @throw SQLException
	 */
	public List<UsersInfo> getList() throws SQLException{
		List<UsersInfo> list = new ArrayList<UsersInfo>();
		String sql = "select * from Users order by username asc";
		ResultSet rs = conn.executeQuery(sql);
		while(rs.next()){
			UsersInfo info = new UsersInfo();
			info.setUsername(rs.getString("UserName"));
			info.setPassword(rs.getString("Password"));
			info.setEmail(rs.getString("Email"));
			info.setPower(rs.getString("Power"));
			list.add(info);
		}
		conn.close();
		return list;
	}
	/**
	 * 判断当前登录用户是否存在
	 * @param id
	 * @return 
	 * @throws SQLException
	 */
	public boolean isExist(String username,String password) throws SQLException{
		boolean result = false;
		UsersInfo info = new UsersInfo();
		String sql = "select * from users u where UserName='" + username + "' and Password='" + password +"'";
		System.out.println(sql);
		ResultSet rs = conn.executeQuery(sql);
		System.out.println(sql);
		if(rs.next()){
			info.setUsername(rs.getString("UserName"));
			info.setPassword(rs.getString("Password"));
			info.setEmail(rs.getString("Email"));
			info.setPower(rs.getString("Power"));
			result = true;
		}
		conn.close();
		System.out.println("user "+username + " is " + (result?"not ":"") + "exist");
		return result;
	}
	
	/**
	 * 获得单个用户信息
	 * @param id
	 * @return 
	 * @throws SQLException
	 */
	public UsersInfo getUsersInfo(String username) throws SQLException {
		UsersInfo info = new UsersInfo();
		String sql = "select * from Users U where UserName = '"+username+"'";
		ResultSet rs = conn.executeQuery(sql);
		while(rs.next()){
			info.setUsername(rs.getString("UserName"));
			info.setPassword(rs.getString("Password"));
			info.setEmail(rs.getString("Email"));
			info.setPower(rs.getString("Power"));
		}
		conn.close();
		return info;
	}
	/**
	 * 判断注册用户是否已存在
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public boolean isExistUsersInfo(String username) throws SQLException{
		boolean result = false;
		UsersInfo info = new UsersInfo();
		String sql = "select * from Users U where UserName='" + username +"'";
		ResultSet rs = conn.executeQuery(sql);
		if(rs.next()){
			info.setUsername(rs.getString("UserName"));
			info.setPassword(rs.getString("Password"));
			info.setEmail(rs.getString("Email"));
			info.setPower(rs.getString("Power"));
			result = true;
		}
		System.out.println("user "+username + " is " + (result?"":"not ") + "exist");
		conn.close();
		return result;
	}
	/**
	 * 用户插入
	 * @param info
	 * @return
	 */
	public int insert(UsersInfo info){
		String sql = "insert into Users(Username,Password,Email,Power) values ";
		sql = sql + "('" + info.getUsername() + "','"+info.getPassword()
				+"','" + info.getEmail()+"','"+info.getPower()+"')";
		int result = 0;
		System.out.print(sql);
		result = conn.executeUpdate(sql);
		System.out.println("excute sql: " + sql + " and the result is "+result);
		conn.close();
		return result;
	}
	/**
	 * 用户修改
	 * @param info
	 * @return 
	 */
	public int update(UsersInfo info){
		String sql = "update Users set Password='"
				+MD5.Encrypt(info.getPassword()) + "',Email='"
				+info.getEmail()+"',Power='"+info.getPower()
				+"'where UserName='"+info.getUsername()+"'";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 用户删除
	 * @param username
	 * @return
	 */
	public int delete(String username){
		String sql = "delete from Users where UserName='" + username + "'";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
}
