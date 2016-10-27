<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="manager-islogin.jsp" %>
<%@ page import="com.blog.dal.Comment"%>
<%@ page import="com.blog.common.DataConverter"%>
<%
	Comment comment = new Comment();		//创建对象
	int result = 0;
	result = comment.delete(DataConverter.toInt(request.getParameter("id")));
	if(result == 1){
		out.println("<script>alert('博文评论删除成功');window.location.href('comment-manage.jsp?blogid="+request.getParameter("blogid")+"');</script>");
	} else {
		out.println("<script>alert('博文评论删除失败');window.location.href('comment-manage.jsp?blogid="+request.getParameter("blogid")+"');</script>");
	}
 %>

<!DOCTYPE HTML>
<html>
  <head>
    <title>My JSP 'comment-delete.jsp' starting page</title>

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
