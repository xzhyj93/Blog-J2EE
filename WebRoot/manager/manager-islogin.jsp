<!-- 验证后台管理员是否登录blog系统页面 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@page import="com.blog.common.Utility" %>
<%@page import="com.blog.common.DataValidator" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

	String data = Utility.readCookie(request, "admin");
	if(DataValidator.isNullOrEmpty(data)){
		response.sendRedirect("manager-login.jsp");
	}
 %>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'islogin.jsp' starting page</title>
    
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
    
  </body>
</html>
