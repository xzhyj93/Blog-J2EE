<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@page import="com.blog.dal.Class" %>
<%@page import="com.blog.model.ClassInfo" %>
<%@page import="com.blog.common.DataConverter" %>
<%@page import="com.blog.model.BlogInfo" %>
<%@page import="com.blog.dal.Blog" %>
<%@page import="com.blog.common.*" %>

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
  
  <%
  	request.setCharacterEncoding("utf-8");
  	String action = request.getParameter("action");
  	String pageAction="";
  	int id=DataConverter.toInt(request.getParameter("id"));
  	BlogInfo info = new BlogInfo();
  	Blog blog = new Blog();
  	//保存
  	if("update".equals(action)||"insert".equals(action)){
  		if("update".equals(action)){
  			info = blog.getBlogInfo(id);
  			if(info==null){
  				//out对象是一个输出流，用来向客户端输出数据。out对象用于各种数据的输出
  				out.println("<script>alert('博文ID有误');window.location.href('login.jsp');</script>");
  			}
  			info.setId(id);
  		}
  		info.setTitle(request.getParameter("txtTitle"));
  		info.setClassid(DataConverter.toInt(request.getParameter("selClass")));
  		info.setContext(request.getParameter("content"));
  		if("insert".equals(action)){
  			info.setCreatedtime(Utility.getNowDateTime());
  			blog.insert(info);
  		} else {
  			blog.update(info);
  		}
  		/* 	response对象对客户的请求作出动态响应，向客户端发送数据
  			在某些情况下，当响应客户时，需要将客户重新引导至另一个页面，则可以使用response的sendRedirect(URL)方法实现客户的重定向
  		 */
  		response.sendRedirect("blog-manage.jsp");
  	}
  	//编辑
  	if("edit".equals(action) || "add".equals(action)) {
        info = blog.getBlogInfo(id);
        if(info == null){
            //Utility.showErrorMessage(pageContext,"学生ID错误");
        }
        pageAction="update";
	}
	//添加
	if("add".equals(action)){
		pageAction="insert";
	}
	//调用在线编辑器
	//CKeditor ckEditor = new CKeditor(request,"content");
	//获得博文分类
	Class cls = new Class();
	List<ClassInfo> list = cls.getList();
	
   %>
  <body>
   	<p>当前位置：博文编辑/添加</p>
   	<form id="form1" name="form1" method="post" action="blog-edit.jsp">
   		<table width="100%" border="1">
   			<tr>
   				<td>博文标题</td>
   				<td>
   					<input type="text" name="txtTitle" id="txtTitle" width="500px" value="<%=info.getTitle() %>" />
   				</td>
   			</tr>
   			<tr>
   				<td>博文所属分类</td>
   				<td>
   					<select name="selClass" id="selClass">
   						<%
   							for(ClassInfo cinfo:list) {
   						 %>
   						 <option value="<%=cinfo.getId() %>"
   						 	<%if(cinfo.getId()==info.getClassid())
   						 		out.print("selected");
   						 	 %>>
   						 	 <%=cinfo.getName() %></option>
   						 <%
   						 	}
   						  %>
   					</select>
   				</td>
   			</tr>
   			<tr>
   				<td>博文内容</td>
   				<td><textarea name="editor01"></textarea></td>
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
    <script>
    	 window.onload = function(){
    	 	CKEDITOR.replace('editor01');
    	 }
    </script>
  </body>
</html>
