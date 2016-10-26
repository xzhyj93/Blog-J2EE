<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="islogin.jsp" %>
<%@page import="com.blog.common.DataConverter" %>
<%@page import="com.blog.model.ClassInfo" %>
<%@page import="com.blog.dal.Class" %>
<%
  	request.setCharacterEncoding("utf-8");
  	String action = request.getParameter("action");
  	String pageAction="";
  	int id=DataConverter.toInt(request.getParameter("id"));
  	ClassInfo info = new ClassInfo();
  	Class cls = new Class();
  	//保存
  	if("update".equals(action)||"insert".equals(action)){
  		if("update".equals(action)){
  			info = cls.getClassInfo(id);
  			if(info==null){
  				out.println("<script>alert('博文ID有误');window.location.href('login.jsp');</script>");
  			}
  			info.setId(id);
  		}
  		info.setName(request.getParameter("txtName"));
  		info.setSort(DataConverter.toInt(request.getParameter("txtSort")));
  		if("insert".equals(action)){
  			cls.insert(info);
  		} else {
  			cls.update(info);
  		}
  		
  		response.sendRedirect("class-manage.jsp");
  	}
  	//编辑
  	if("edit".equals(action) || "add".equals(action)) {
        info = cls.getClassInfo(id);
        if(info == null){
            //Utility.showErrorMessage(pageContext,"学生ID错误");
        }
        pageAction="update";
	}
	//添加
	if("add".equals(action)){
		pageAction="insert";
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
   	<p>当前位置：分类编辑/添加</p>
   	<form id="form1" name="form1" method="post" action="class-edit.jsp">
   		<table width="100%" border="1">
   			<tr>
   				<td>分类名称</td>
   				<td>
   					<input type="text" name="txtName" id="txtName" width="500px" value="<%=info.getName() %>" />
   				</td>
   			</tr>
   			<tr>
   				<td>排序</td>
   				<td>
   					<input type="text" name="txtSort" id="txtSort" width="500px" value="<%=info.getSort() %>" />
   				</td>
   			</tr>
   			<tr>
   				<td colspan="2">
   					<input type="submit" name="button" id="button" value="提交"/>
   					<input type="reset" name="button2" id="button2" value="重置"/>
   					<input type="hidden" name="action" value="<%=pageAction%>"/>
   					<input type="hidden" name="id" value="<%=info.getId()%>"/>
   				</td>
   			</tr>
   		</table>
   	</form>
  </body>
</html>
