<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="islogin.jsp" %>
<%@page import="com.blog.common.DataConverter" %>
<%@page import="com.blog.model.UsersInfo" %>
<%@page import="com.blog.dal.Users" %>
<%@page import="com.blog.common.*" %>

<%
 	request.setCharacterEncoding("utf-8");
 	String action = request.getParameter("action");
 	String pageAction="";
 	String username=request.getParameter("username");
 	UserInfo info = new UserInfo();
 	Users user  = new Users();
 	//保存
 	if("update".equals(action)){
 		info.user.getUsersInfo(username);
		if(info==null){
			out.println("<script>alert('用户ID有误');window.location.href('users-manage.jsp');</script>");
		}
 		info.setUsername(username);
 		info.setPassword(request.getParameter("txtPassword"));
 		String email = "";
 		if(DataValidator.isEmail(request.getParameter("txtEmail"))){
 			email=request.getParameter("txtEmail");
 		} else {
 			email = "";
 		}
 		info.setEmail(email);
 		info.setPower(request.getParameter("selPower"));
 		if("update".equals(action)){
 			user.update(info);
 		}
 		response.sendRedirect("users-manage.jsp");
 	}
 	//编辑
 	if("edit".equals(action)) {
       info = user.getUsersInfo(username);
       if(info == null){
           //Utility.showErrorMessage(pageContext,"学生ID错误");
       }
       pageAction="update";
	}
	//添加
	if("edit".equals(action)){
		info = user.getUsersInfo(username);
		if(info==null){
			//Utility.showErrorMessage(pageContext,"学生ID错误");
		}
		pageAction="update";
	}

  %>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'blog-edit.jsp' starting page</title>
    
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
   	<p>当前位置：用户编辑/添加</p>
   	<form id="form1" name="form1" method="post" action="users-edit.jsp">
   		<table width="100%" border="1">
   			<tr>
   				<td>用户名</td>
   				<td>
   					<input type="text" name="txtUserName" id="txtUserName" width="500px" value="<%=info.getUsername() %>" readonly="readonly" />
   				</td>
   			</tr>
   			<tr>
   				<td>密码</td>
   				<td>
   					<input type="password" name="txtPassword" id="txtPassword" width="500px" value="<%=info.getPassword() %>" />
   				</td>
   			</tr>
   			<tr>
   				<td>Email</td>
   				<td>
					<input type="text" name="txtEmail" width="500px" value="<%=info.getEmail() %>" />
				</td>
   			</tr>
   			<tr>
   				<td>身份</td>
   				<td>
   					<select name="selPower">
   						<option value="admin">管理员</option>
   						<option value="user">一般用户</option>
   					</select>
   				</td>
   			</tr>
   			<tr>
   				<td colspan="2">
   					<input type="submit" name="button" id="button" value="提交"/>
   					<input type="reset" name="button2" id="button2" value="重置"/>
   					<input type="hidden" name="action" value="<%=pageAction%>"/>
   					<input type="hidden" name="username" value="<%=info.getUsername()%>"/>
   				</td>
   			</tr>
   		</table>
   	</form>
    <script>
    	 window.onload = function(){
    	 	CKEDITOR.replace('editor01');
    	 }
    </script>
  </body>
</html>
