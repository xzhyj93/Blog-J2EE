<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@page import="com.blog.dal.Users" %>
<%@page import="com.blog.model.UsersInfo" %>
<%@page import="com.blog.common.MD5" %>
<%@page import="com.blog.common.DataValidator" %>
<%@page import="com.blog.common.Utility" %>
<%
	Users users = new Users();
	String username = request.getParameter("UserName");
	String password = MD5.Encrypt(request.getParameter("Password"));
	if(!users.isExist(username,password)){
		out.println("<script>alert('用户名密码有误');window.location.href='login.jsp';</script>");
	} else {
		Utility.writeCookie(response, "user", username);
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE HTML>
<html>
  <head> 
    <title>登陆检测</title>
    
	<meta name="pragma" content="no-cache">
	<meta name="cache-control" content="no-cache">
	<meta name="expires" content="0">    
	<meta name="keywords" content="登陆,J2EE,检查登陆">
	<meta name="description" content="This is page to check user login message...">

  </head>
  
  <body>
  </body>
</html>
