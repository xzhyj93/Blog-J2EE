<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.blog.common.Utility" %>
<%@ page import="com.blog.common.DataValidator" %>
<%-- <%@ page import="com.sun.corba.se.spi.orbutil.fsm.Action" %> --%>
 <%@ page import="com.blog.dal.Users" %>
<%@ page import="com.blog.common.MD5" %>
<%@ page import="com.blog.common.DataConverter" %>
<%@ page import="com.blog.dal.Comment" %>
<%@ page import="com.blog.model.CommentInfo" %>
<%
	if("login".equals(request.getParameter("action"))){
		Users users = new Users();
		String username = request.getParameter("txtUserName");
		String password = MD5.Encrypt(request.getParameter("txtPassword"));
		if(!users.isExist(username, password)){
			out.println("<script>alert('用户名密码有误');window.location.href('blog-information.jsp?id="+DataConverter.toInt(request.getParameter("id"))+"');</script>");
		} else {
			Utility.writeCookie(response, "user", username);
			response.sendRedirect("blog-information.jsp?id="+DataConverter.toInt(request.getParameter("id")));
		}
	}
	if("save".equals(request.getParameter("action"))){
		Comment comment = new Comment();
		CommentInfo info = new CommentInfo();
		info.setBlogid(DataConverter.toInt(request.getParameter("id")));
		info.setContext(request.getParameter("txtContext"));
		info.setUsername(Utility.readCookie(request, "user"));
		comment.insert(info);
		response.sendRedirect("blog-information.jsp?id="+DataConverter.toInt(request.getParameter("id")));
	}
 %>
 
<!DOCTYPE HTML>
<html>
  <head>
    <title>My JSP 'comment.jsp' starting page</title>

	<meta name="keywords" content="评论,博文">
	<meta name="description" content="This is a page to show comments">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<%
 	String data = Utility.readCookie(request, "user");
 	if(DataValidator.isNullOrEmpty(data)){
  %>
  <form id="form1" name="form1" method="post" action="comment.jsp?action=login">
  	<table style="width:400px; border:none">
  		<tr>
  			<td>用户名</td><td><input name="id" type="hidden" id="id" value="<%=request.getParameter("id") %>"/></td>
  			<td><input name="txtUserName" type="text" id="txtUserName" size="12"/></td>
  			<td>密码</td>
  			<td><input name="txtPassword" type="password" id="txtPassword" size="12"/></td>
  			<td><input type="submit" name="button" id="button" value="提交"/><a href="register.jsp">注册</a></td>
  		</tr>
  	</table>
  </form>
  <%} else { %>
  欢迎您：<%=Utility.readCookie(request, "user") %><a href="login.jsp">退出</a>
  <form name="commentForm" method="post" action="comment.jsp?aciton=save">
  	<input name="id" type="hidden" id="id" value="<%=request.getParameter("id") %>"/>
  	<textarea rows="4" cols="50" name="txtContext"></textarea>
  	<input type="submit" name="button" value="回复">
  </form>
  <%} %>  </body>
</html>
