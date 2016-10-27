<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@page import="com.blog.dal.Users" %>
<%@page import="com.blog.model.UsersInfo" %>
<%@page import="com.blog.common.MD5" %>
<%@page import="com.blog.common.DataValidator" %>
<%@page import="com.blog.common.Utility" %>
<%
	Users users = new Users();
	String username = request.getParameter("AdminName");
	String password = MD5.Encrypt(request.getParameter("Password"));
	if(!users.isExist(username,password)){
		out.println("<script>alert('用户名密码有误');window.location.href('login.jsp');</script>");
	} else {
		Utility.writeCookie(response, "admin", username);
		response.sendRedirect("index.html");
	}
%>
<!DOCTYPE HTML>
<html>
  <head>
<%--     <base href="<%=basePath%>">
 --%>    
    <title>My JSP 'login-check.jsp' starting page</title>
    
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
  	
    This is my JSP page. <br>
  </body>
</html>
