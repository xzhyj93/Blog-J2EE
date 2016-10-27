<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.blog.dal.Users"%>
<%@ page import="com.blog.model.UsersInfo"%>
<%@ include file="manager-islogin.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	Users user = new Users();
	String keyword=request.getParameter("keyword");
	List<UsersInfo> list=user.getList();
	for(UsersInfo userss:list){
		userss.getUsername();
		}
 %>
<!DOCTYPE HTML>
<html>
  <head>
    <title>My JSP 'class-manage.jsp' starting page</title>

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
		当前位置：用户管理
	</p>
	<table style="width:98%; border:1px">
  		<tr>
  			<td>用户名</td>
  			<td>Email</td>
  			<td>身份</td>
  			<td>操作</td>
  		</tr>
  		<%
  			for(UsersInfo info:list) {//遍历输出list集合中的数据
  		 %>
  		<tr>
  			<td><%=info.getUsername() %></td>
  			<td><%=info.getEmail() %></td>
  			<td><%=info.getPower() %></td>
  			<td>
  				<a href="users-edit.jsp?username=<%=info.getUsername()%>&action=edit">编辑</a>
  				|<a href="users-delete.jsp?username=<%=info.getUsername() %>">删除</a> 
   			</td>
  		</tr>
  		<%
  			}
  		 %>
  	</table>
  </body>
</html>
