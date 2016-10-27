<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.blog.common.Utility" %>
<%@ page import="com.blog.common.DataValidator" %>
<%@ page import="com.blog.common.DataConverter" %>
<%@ page import="com.blog.common.MD5" %>
<%@ page import="com.blog.dal.Users" %>
<%@ page import="com.blog.dal.Class" %>
<%@ page import="com.blog.model.BlogInfo" %>
<%@ page import="com.blog.model.UsersInfo" %>
<%@ page import="com.blog.model.ClassInfo" %>

<%
	System.out.println(request.getParameter("txtUserName"));
	request.setCharacterEncoding("utf-8");
	String action = request.getParameter("action");
	UsersInfo info = new UsersInfo();
	Users user = new  Users();
	if("reg".equals(action)){
		if(user.isExistUsersInfo(request.getParameter("txtUserName"))){
			out.println("<script>alert('用户已存在');window.location.href('register.jsp');</script>");
		} else {
			info.setUsername(request.getParameter("txtUserName"));
			info.setPassword(MD5.Encrypt(request.getParameter("txtPassword")));
			info.setEmail(request.getParameter("txtEmail"));
			info.setPower("user");
			user.insert(info);
			out.println("<script>alert('注册成功');window.location.href='index.jsp';</script>");
		}
	}
 %>

<!DOCTYPE HTML>
<html>
  <head>
    <title>新用户注册</title>

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
    <article id="content">
    	<form id="form1" name="form1" method="post" action="register.jsp?action=reg">
    		<table width="100%" border="0">
    			<tr>
    				<td>
    					用户名
    				</td>
    				<td>
    					<input type="text" name="txtUserName" id="txtUserName" width="500px"/>
    				</td>
    			</tr>
    			<tr>
    				<td>密码</td>
    				<td><input type="password" name="txtPassword" id="txtPassword" width="500px" /></td>
    			</tr>
    			<tr>
    				<td>确认密码</td>
    				<td><input type="password" name="txtPassword2" id="txtPassword2" width="500px" /></td>
    			</tr>
    			<tr>
    				<td>Email</td>
    				<td><input type="text" name="txtEmail" width="500px" /></td>
    			</tr>
    			<tr>
    				<td colspan="2">
    					<input type="submit" name="button" id="button" value="注册" />
    					<input type="reset" name="button2" id="button2" value="重置" />
    				</td>
    			</tr>
    		</table>
    	</form>
    </article>
  </body>
</html>
