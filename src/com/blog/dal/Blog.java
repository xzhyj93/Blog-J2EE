package com.blog.dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.blog.common.Conn;
import com.blog.common.DataValidator;
import com.blog.model.BlogInfo;

public class Blog {
	Conn conn = new Conn();
	/**
	 * 获取博文列表
	 * @return 
	 * @throw SQLException
	 */
	public List<BlogInfo> getList(String keyword) throws SQLException{
		List<BlogInfo> list = new ArrayList<BlogInfo>();
		String sql = "select b.*, c.name as ClassName from Blog b left join class c on b.classid = c.id";
		if(DataValidator.isNullOrEmpty(keyword)){
			sql = sql + " order by id desc";
		} else {
			sql = sql + " where b.title like '%" + keyword + "%' order by id desc";
		}
		ResultSet rs = conn.executeQuery(sql);
		while(rs.next()){
			BlogInfo info = new BlogInfo();
			info.setId(rs.getInt("Id"));
			info.setTitle(rs.getString("Title"));
			info.setContext(rs.getString("Context"));
			info.setCreatedtime(rs.getDate("CreatedTime"));
			info.setClassid(rs.getInt("ClassId"));
			info.setClassName(rs.getString("ClassName"));
			list.add(info);
		}
		conn.close();
		return list;
	}
	/**
	 * 获得某分类下面的所有博文列表
	 * @param classId
	 * @return 
	 * @throws SQLException
	 */
	public List<BlogInfo> getListByClassId(int classId) throws SQLException {
		List<BlogInfo> list = new ArrayList<BlogInfo>();
		String sql = "select b.*,c.name as ClassName from Blog b left join class c on b.classid=c.id where b.classId = "+classId+" order by id desc";
		ResultSet rs = conn.executeQuery(sql);
		while(rs.next()){
			BlogInfo info = new BlogInfo();
			info.setId(rs.getInt("Id"));
			info.setTitle(rs.getString("Title"));
			info.setContext(rs.getString("Context"));
			info.setCreatedtime(rs.getDate("CreatedTime"));
			info.setClassid(rs.getInt("ClassId"));
			info.setClassName(rs.getString("ClassName"));
			list.add(info);
		}
		conn.close();
		return list;
	}
	/**
	 * 获得单条博文
	 * @param id
	 * @return 
	 * @throws SQLException
	 */
	public BlogInfo getBlogInfo(int id) throws SQLException {
		BlogInfo info = new BlogInfo();
		String sql = "select b.*,c.name as ClassName from Blog b left join class c on b.classid=c.id where b.id = "+id+"";
		ResultSet rs = conn.executeQuery(sql);
		while(rs.next()){
			info.setId(rs.getInt("Id"));
			info.setTitle(rs.getString("Title"));
			info.setContext(rs.getString("Context"));
			info.setCreatedtime(rs.getDate("CreateTime"));
			info.setClassid(rs.getInt("ClassId"));
			info.setClassName(rs.getString("ClassName"));
		}
		conn.close();
		return info;
	}
	/**
	 * 博文插入操作
	 * @param info
	 * @return
	 */
	public int insert(BlogInfo info){
		String sql = "insert into Blog(Title,Context,CreatedTime,ClassId) values";
		sql = sql + "('" + info.getTitle() + "','"+info.getContext()
				+"',now()," + info.getClassid()+")";
		int result = 0;
		System.out.print(sql);
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 博文修改
	 * @param info
	 * @return 
	 */
	public int update(BlogInfo info){
		String sql = "update Blog set"+ " Title='"+info.getTitle()
				+"',Context='"+info.getContext()+"',Classid='"
				+info.getClassid() + "'where id="+info.getId()+"";
		int result = 0;
		System.out.print(sql);
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 博文删除
	 * @param id
	 * @return
	 */
	public int delete(int id){
		String sql = "delete from Blog where id=" + id + "";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}

}
