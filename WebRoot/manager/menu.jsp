<%@page import="com.blog.common.Utility"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'menu.jsp' starting page</title>
    
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
  <table width="256" border="0">
  	<tr><td>博客管理系统后台</td></tr>
  	<tr><td>欢迎您:<%=Utility.readCookie(request, "admin") %><a href="logon.jsp" target="_parent">退出</a></td></tr>
  	<tr><td><a href="/blog/manager/blog-edit.jsp?action=add" target="rightFrame">发布博文</a></td></tr>
  	<tr><td><a href="/blog/manager/blog-manage.jsp" target="rightFrame">博文管理</a></td></tr>
  	<tr><td>&nbsp;</td></tr>
  	<tr><td><a href="/blog/manager/class-edit.jsp?action=add" target="rightFrame">添加博文分类</a></td></tr>
  	<tr><td><a href="/blog/manager/class-manage.jsp" target="rightFrame">博文分类管理</a></td></tr>
  	<tr><td>&nbsp;</td></tr>
  	<tr><td><a href="/blog/manager/users-manage.jsp" target="rightFrame">用户管理</a></td></tr>
  </table>
    This is my JSP page. <br>
  </body>
</html>
