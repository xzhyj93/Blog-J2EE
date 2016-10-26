package com.blog.dal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.activation.CommandInfo;

import com.blog.common.Conn;
import com.blog.model.CommentInfo;

public class Comment {
	Conn conn = new Conn();
	/**
	 * ��ȡ���������б�
	 * @return 
	 * @throws SQLException
	 */
	public List<CommentInfo> getList() throws SQLException{
		List<CommentInfo> list = new ArrayList<CommentInfo>();
		String sql = "select * from Comment order by id desc";
		ResultSet rs = conn.executeQuery(sql);
		while(rs.next()){
			CommentInfo info = new CommentInfo();
			info.setId(rs.getInt("Id"));
			info.setContext(rs.getString("Context"));
			info.setBlogid(rs.getInt("BlogId"));
			info.setCreatedtime(rs.getDate("CreatedTime"));
			info.setUsername(rs.getString("UserName"));
			list.add(info);
		}
		conn.close();
		return list;
	}
	/**
	 * ��ȡ����������
	 * @return 
	 * @throws SQLException
	 */
	public CommentInfo getCommentInfo(int id) throws SQLException{
		CommentInfo info = new CommentInfo();
		String sql = "select * from Comment c where id="+id+"";
		ResultSet rs = conn.executeQuery(sql);
		while(rs.next()){
			info.setId(rs.getInt("Id"));
			info.setContext(rs.getString("Context"));
			info.setBlogid(rs.getInt("BlogId"));
			info.setCreatedtime(rs.getDate("CreatedTime"));
			info.setUsername(rs.getString("UserName"));
		}
		conn.close();
		return info;
	}
	/**
	 * ��ȡĳ���ĵ���������
	 * @param id
	 * @return 
	 * @throws SQLException
	 */
	public List<CommentInfo> getListByBlogId(int blogid) throws SQLException{
		List<CommentInfo> list = new ArrayList<CommentInfo>();
		String sql = "select * from Comment where blogid="+blogid+" order by id desc";
		ResultSet rs = conn.executeQuery(sql);
		while(rs.next()){
			CommentInfo info = new CommentInfo();
			info.setId(rs.getInt("Id"));
			info.setContext(rs.getString("Context"));
			info.setBlogid(rs.getInt("BlogId"));
			info.setCreatedtime(rs.getDate("CreatedTime"));
			info.setUsername(rs.getString("UserName"));
			list.add(info);
		}
		conn.close();
		return list;
	}
	/**
	 * �������۲���
	 * @param info
	 * @return
	 */
	public int insert(CommentInfo info){
		String sql = "insert into Comment (Context,BlogId,CreatedTime,UserName) values ";
		sql = sql + " ('" + info.getContext() + "'," + info.getBlogid() + ",now(), '"+ info.getUsername() + "')";
		int result = 0;
		System.out.println(sql);
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * ���������޸�
	 * @param info
	 * @return
	 */
	public int update(CommentInfo info){
		String sql = "update Comment set" + " Context='"+info.getContext()
				+"',BlogId="+info.getBlogid()+",CreatedTime='"
				+info.getCreatedtime()+"',UserName='"+info.getUsername()
				+"' where id="+info.getId()+"";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * ��������ɾ��
	 * @param id
	 * @return 
	 */
	public int delete(int id){
		String sql = "delete from Comment where id=" + id + "";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
}
