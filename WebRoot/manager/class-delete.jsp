<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="islogin.jsp" %>
<%@ page import="com.blog.dal.Class" %>
<%@ page import="com.blog.common.DataConverter" %>

<%
	Class cls = new Class();		//创建对象
	int result = 0;
	result = cls.delete(DataConverter.toInt(request.getParameter("id")));
	if(result == 1){
		out.println("<script>alert('分类删除成功');window.location.href('class-manage.jsp');</script>");
	} else {
		out.println("<script>alert('分类删除失败');window.location.href('class-manage.jsp');</script>");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'blog-delete.jsp' starting page</title>
    
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
