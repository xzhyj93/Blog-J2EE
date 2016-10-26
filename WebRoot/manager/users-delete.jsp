<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="islogin.jsp" %>
<%@ page import="com.blog.dal.Users" %>
<%@ page import="com.blog.common.DataConverter" %>

<%
	Users user = new Users();		//创建对象
	int result = 0;
	result = user.delete(DataConverter.toInt(request.getParameter("username")));
	if(result == 1){
		out.println("<script>alert('用户删除成功');window.location.href('users-manage.jsp');</script>");
	} else {
		out.println("<script>alert('用户删除失败');window.location.href('users-manage.jsp');</script>");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'users-delete.jsp' starting page</title>
    
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
