<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML>
<html>
  <head>
    
    <title>用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/styles.css">

  </head>
  
  <body>
  	<form name="loginform" action="./login-check.jsp" method="post" onsubmit="return check(this)">
  		<table style="width:350px; border:none; cellspacing:1px; cellpadding:0px; margin-top:50px" class="center">
  			<tr>
  				<td colspan="2" align="center" class="table-head"><strong>用户登录</strong></td>
  			</tr>
  			<tr>
  				<td width="101" class="item">昵称:</td>
  				<td width="246" class="input"><input name="UserName" type="text" id="UserName" size="30" required/></td>
  			</tr>
  			<tr>
  				<td class="item">登录密码:</td>
  				<td class="input"><input name="Password" type="password" id="Password" size="30" required/></td>
  			</tr>
  			<tr>
  				<td colspan="2" class="button"><button type="submit" value=" 登录 " class="center">登录</button></td>
  			</tr>
  			<tr>
  				<td></td><td colspan="2" class="fl-right"><a href="./register.jsp" ><small>注册新用户</small></a></td>
  			</tr>
  		</table>
  	</form>
	<script type="text/javascript">
		function check(form){
			if(document.loginform.UserName.value==""){
				alert("请输入昵称");
				document.loginform.UserName.focus();
				return false;
			}
			if(document.loginform.Password.value=""){
				alert("请输入登录密码");
				document.loginform.Password.focus();
				return false;
			}
		}
		window.onload = function(){
			document.getElementById("UserName").focus();
			document.getElementById("UserName").value="";
			document.getElementById("Password").value="";
		}
	</script>
  </body>
</html>
