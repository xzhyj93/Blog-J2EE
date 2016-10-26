package com.blog.model;
import java.util.Date;

public class CommentInfo {
	private int id;
	private String context="";
	private Date createdtime;
	private String username="";
	private int blogid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Date getCreatedtime() {
		return createdtime;
	}
	public void setCreatedtime(Date createtime) {
		this.createdtime = createtime;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getBlogid() {
		return blogid;
	}
	public void setBlogid(int blogid) {
		this.blogid = blogid;
	}
	
}
