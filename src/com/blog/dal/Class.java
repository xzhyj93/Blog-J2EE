package com.blog.dal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.blog.common.Conn;
import com.blog.model.ClassInfo;

public class Class {
	Conn conn = new Conn();
	/**
	 * ��ȡ���ķ����б�
	 * @return 
	 * @throws SQLException
	 */
	public List<ClassInfo> getList() throws SQLException{
		List<ClassInfo> list = new ArrayList<ClassInfo>();
		String sql = "select * from Class order by Sort asc";
		ResultSet rs = conn.executeQuery(sql);
		while(rs.next()){
			ClassInfo info = new ClassInfo();
			info.setId(rs.getInt("Id"));
			info.setName(rs.getString("Name"));
			info.setSort(rs.getInt("Sort"));
			list.add(info);
		}
		conn.close();
		return list;
	}
	/**
	 * ��õ���������Ϣ
	 * @param id
	 * @return 
	 * @throws SQLException
	 */
	public ClassInfo getClassInfo(int id) throws SQLException{
		ClassInfo info = new ClassInfo();
		String sql = "select * from Class c where id = " + id + "";
		ResultSet rs = conn.executeQuery(sql);
		if(rs.next()){
			info.setId(rs.getInt("Id"));
			info. setName(rs.getString("Name"));
			info.setSort(rs.getInt("Sort"));
		}
		conn.close();
		return info;
	}
	/**
	 * ���ķ������
	 * @param info
	 * @return
	 */
	public int insert(ClassInfo info){
		String sql = "insert into Class(Name,Sort) values ";
		sql = sql+"('" + info.getName() + "'," + info.getSort()+"')";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * ���ķ����޸�
	 * @param info
	 * @return 
	 */
	public int update(ClassInfo info){
		String sql = "update Class set" + "Name='"+info.getName()
				+"',Sort="+info.getSort()+" where id="+info.getId()+"";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * ���ķ���ɾ��
	 * @param id
	 * @return
	 */
	public int delelte(int id){
		String sql = "delete from Class where id="+id+"";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
}
