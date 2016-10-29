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
			out.println("<script>alert('用户已存在');window.location.href='register.jsp';</script>");
		} else {
			info.setUsername(request.getParameter("txtUserName"));
			info.setPassword(MD5.Encrypt(request.getParameter("txtPassword")));
			System.out.println("超人:"+MD5.Encrypt("hao"));
			System.out.println("蜘蛛侠:"+MD5.Encrypt(request.getParameter("txtPassword")));
			System.out.println("蝙蝠侠:"+info.getPassword());
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
	
	<link rel="stylesheet" type="text/css" href="css/styles.css">


  </head>
  
  <body class="center-father">
    <article id="content" style="margin-top:100px">
    	<form id="form1" name="form1" method="post" action="register.jsp?action=reg">
    		<table width="400px" border="0">
    			<tr>
    				<td style="width:20%">
    					用户名
    				</td>
    				<td style="width:70%">
    					<input type="text" name="txtUserName" id="txtUserName" required/>
    				</td>
    			</tr>
    			<tr>
    				<td>密码</td>
    				<td><input type="password" name="txtPassword" id="txtPassword" required/></td>
    			</tr>
    			<tr>
    				<td>确认密码</td>
    				<td><input type="password" name="txtPassword2" id="txtPassword2" required/></td>
    			</tr>
    			<tr>
    				<td>Email</td>
    				<td><input type="email" name="txtEmail" required/></td>
    			</tr>
    			<tr style="height:4em">
    				<td colspan="2" style="text-align:center; width:100%" >
    					<button type="submit" 	name="button" id="button" value="注册">注册</button>
    					<button type="reset" name="button2" id="button2" value="重置" >重置</button>
    				</td>
    			</tr>
    			<tr>
	  				<td></td><td colspan="2" class="fl-right"><a href="login.jsp" ><small style="line-height:2em; color:#555">已有账号，直接登录→</small></a></td>
	  			</tr>
    		</table>
    	</form>
    </article>
    <script>
    	/**
     	 * 关于提交表单验证这里有一些要注意的：
     	 * 表单的onsubmit事件会在表单中的确认按钮被点击时发生，于是可以在onsubmit事件绑定的函数中进行表单输入验证
     	 * 有尝试直接绑定checkSubmit函数到提交按钮的click事件，但是这样会导致：表单中原本由input的属性定义的一些比如非空，邮箱验证等条件判断无法判断。所以是不可以这样使用的。
    	 */
    	window.onload = function(){
    		document.form1.onsubmit = checkSubmit;
    	}
    	function checkSubmit(){
    		var pw1 = (document.form1.txtPassword.value).trim();
    		var pw2 = (document.form1.txtPassword2.value).trim();
    		console.log(pw1);
    		console.log(pw2);
    		if(pw1 != pw2){
    			alert("两次密码输入不一致！");
    			return false;
    		} 
    	}
    </script>
  </body>
</html>
