<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="islogin.jsp" %>
<%@page import="com.blog.model.BlogInfo" %>
<%@page import="com.blog.dal.Blog" %>
<%
/* String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 */%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'blog-manage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <%
  	/* 	request对象封装了用户提交给服务器的所有信息，通过request对象可以获取用户提交的信息。
  		request对象可以使用getParameter(string s)方法获取该表单通过text提交的信息。（s对应提交表单输入中name值）
  		使用request对象获取信息时，要避免使用空对象，否则会出现NullPointerException异常
  	 */
  	request.setCharacterEncoding("utf-8");
  	Blog blog = new Blog();
  	String keyword = request.getParameter("keyword");
  	List<BlogInfo> list = blog.getList(keyword);
   %>
  <body>
  	<p>当前位置：博文管理</p>
  	<form id="form1" name="form1" method="post" action="blog-manage.jsp">
  		查询条件：博文标题
  		<input type="text" name="keyword" id="keyword" />
  		<input type="submit" name="button" id="button" value="查询"/>
  	</form>
  	<table width="98%" border="1">
  		<tr>
  			<td>博文标题</td>
  			<td>所属分类</td>
  			<td>发布时间</td>
  			<td>操作</td>
  		</tr>
  		<%
  			for(BlogInfo info:list) {//遍历输出list集合中的数据
  		 %>
  		<tr>
  			<td><%=info.getTitle() %></td>
  			<td><%=info.getClassName() %></td>
  			<td><%=info.getCreatedtime() %></td>
  			<td><a href="blog-edit.jsp?id=<%=info.getId()%>&action=edit">编辑</a>
  				|<a href="blog-delete.jsp?id=<%=info.getId() %>">删除</a> 
  				|<a href="comment-manage.jsp?blogid=<%=info.getId() %>">评论</a> 
   			</td>
  		</tr>
  		<%
  			}
  		 %>
  	</table>
  </body>
</html>
