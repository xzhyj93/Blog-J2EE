<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML>
<html>
  <head>
    
    <title>用户登录</title>
    
	<meta http-equiv="Content-type" content="text/html; Charset=utf-8">
	<meta name="Expires" content="0">    
	<meta name="keywords" content="keyword1,keyword2,keyword3">
	<meta name="description" content="This is page for users log in">
	<link rel="stylesheet" type="text/css" href="css/styles.css">

  </head>
  
  <body>
  	<form name="loginform" action="./login-check.jsp" method="post" onsubmit="return check(this)">
  		<table style="width:350px; border:none; cellspacing:1px; cellpadding:0px; margin-top:50px" class="center">
  			<tr>
  				<td colspan="2" style="align:center" class="table-head"><strong>用户登录</strong></td>
  			</tr>
  			<tr>
  				<td style="width:101px" class="item">昵称:</td>
  				<td style="width:246px" class="input"><input name="UserName" type="text" id="UserName" size="30" required/></td>
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
			//这里因为判断相等写了=，表单提交密码为空，一直登陆不上……吸取教训！！什么破错误！！
			if(document.loginform.Password.value==""){
				alert("请输入登录密码");
				document.loginform.Password.focus();
				return false;
			}
		}
		window.onload = function(){
			document.getElementById("UserName").focus();
			document.getElementById("UserName").value="";
			document.getElementById("Password").value="";
		};
	</script>
  </body>
</html>
