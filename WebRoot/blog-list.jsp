<!-- 博文分类查找页面 -->
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.blog.model.BlogInfo" %>
<%@ page import="com.blog.dal.Blog" %>
<%@ page import="com.blog.common.DataValidator" %>
<%@ page import="com.blog.common.Utility" %>
<%@ page import="com.blog.dal.Class" %>
<%@ page import="com.blog.model.ClassInfo" %>
<%@ page import="com.blog.common.DataConverter" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	Blog blog = new Blog();
	int classId = DataConverter.toInt(request.getParameter("classid"));
	List<BlogInfo> list = blog.getListByClassId(classId);
	//获得博文分类
	Class cls = new Class();
	List<ClassInfo> clist = cls.getList();
 %>
<!DOCTYPE HTML>
<html>
  <head>
    <title>My JSP 'blog-list.jsp' starting page</title>

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
    <%
    	for(BlogInfo info:list){	//遍历输出list集合中的数据
     %>
     <div class="post">
     	<h1 class="title"><a href="blog-information.jsp?id=<%=info.getId() %>"><%=info.getTitle() %></a></h1>
        <p class="byline"><small><%=info.getCreatedtime() %></small></p>
        <div class="entry">
        	<p><%=Utility.substring(DataValidator.removeHtml(info.getContext()), 300) %></p>
        </div>
        <p class="meta"><a href="#" class="more">分类：<%=info.getClassName() %></a> &nbsp;&nbsp;&nbsp;<a href="#" class="more">详情</a> &nbsp;&nbsp;&nbsp;</p>
     </div>
    <%
    	}
     %>
    </article>
  </body>
</html>
