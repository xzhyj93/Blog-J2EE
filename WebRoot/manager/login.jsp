<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
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
  	<form name="loginform" action="./login-check.jsp" method="post" onsubmit="return check(this)">
  		<table width="350" border="0" cellspacing="1" cellpadding="0">
  			<tr>
  				<td colspan="2" align="center"><strong>博客系统管理员登录</strong></td>
  			</tr>
  			<tr>
  				<td width="101" class="item">管理员名:</td>
  				<td width="246" class="input"><input name="AdminName" type="text" id="AdminName" size="30" /></td>
  			</tr>
  			<tr>
  				<td class="item">登录密码:</td>
  				<td class="input"><input name="Password" type="password" id="Password" size="30"/></td>
  			</tr>
  			<tr>
  				<td colspan="2" class="button"><input type="submit" value=" 登录 " /></td>
  			</tr>
  		</table>
  	</form>
	<script language="javascript" type="text/javascript">
		function check(form){
			if(document.loginform.AdminName.value==""){
				alert("请输入管理员名");
				document.loginform.AdminName.focus();
				return false;
			}
			if(document.loginform.Password.value=""){
				alert("请输入登录密码");
				document.loginform.Password.focus();
				return false;
			}
		}
		window.onload = function(){
			document.getElementById("AdminName".focus());
			document.getElementById("AdminName").value="";
			document.getElementById("Password").value="";
		}
	</script>
  </body>
</html>
