<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.blog.dal.Class"%>
<%@ page import="com.blog.model.ClassInfo"%>
<%@ include file="manager-islogin.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	Class cls = new Class();
	String keyword=request.getParameter("keyword");
	List<ClassInfo> list=cls.getList();
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
		当前位置：分类管理
	</p>
	<table width="98%" border="1">
  		<tr>
  			<td>名称</td>
  			<td>排序</td>
  			<td>操作</td>
  		</tr>
  		<%
  			for(ClassInfo info:list) {//遍历输出list集合中的数据
  		 %>
  		<tr>
  			<td><%=info.getName() %></td>
  			<td><%=info.getSort() %></td>
  			<td>
  				<a href="class-edit.jsp?id=<%=info.getId()%>&action=edit">编辑</a>
  				|<a href="class-delete.jsp?id=<%=info.getId() %>">删除</a> 
   			</td>
  		</tr>
  		<%
  			}
  		 %>
  	</table>
  </body>
</html>
