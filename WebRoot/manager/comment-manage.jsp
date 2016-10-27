<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.blog.dal.Comment"%>
<%@ page import="com.blog.model.CommentInfo"%>
<%@ page import="com.blog.common.DataConverter"%>
<%@ page import="com.blog.common.Utility" %>
<%@ include file="manager-islogin.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	Comment comment=new Comment();
	String keyword=request.getParameter("keyword");
	int blogid = DataConverter.toInt(request.getParameter("blogid"));
	List<CommentInfo> list=comment.getListByBlogId(blogid);
 %>

<!DOCTYPE HTML>
<html>
  <head>
    <title>My JSP 'comment-manage.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <p>
    	当前位置：评论管理
    </p>
    <table width="98%" border="1">
    	<tr>
    		<td>评论内容</td>
    		<td>评论人</td>
    		<td>评论时间</td>
    		<td>操作</td>
    	</tr>
    	<%
    		for(CommentInfo info:list) {	//遍历输出list集合中的 
    	 %>
    	 <tr>
    	 	<td><%=Utility.substring(DataValidator.removeHtml(info.getContext()),100) %></td>
    	 	<td><%=info.getUsername() %></td>
    	 	<td><%=info.getCreatedtime() %></td>
    	 	<td>
    	 		<a href="comment-delete.jsp?id=<%=info.getId() %>&blogid=<%=info.getBlogid() %>">删除</a>
    	 	</td>
    	 </tr>
    	 <%
    	 	}
    	  %>
    </table>
  </body>
</html>
