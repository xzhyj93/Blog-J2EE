<!-- page指令是针对当前页面的指令，作用于整个JSP。通常位于JSP的顶端，一个JSP可以有多条page指令，但是其属性只能出现一次，重复的属性设置将覆盖之前的设置 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.blog.model.BlogInfo" %>
<%@ page import="com.blog.dal.Blog" %>
<%@ page import="com.blog.common.DataValidator" %>
<%@ page import="com.blog.common.Utility" %>
<%@ page import="com.blog.dal.Class" %>
<%@ page import="com.blog.model.ClassInfo" %>
<%@ page import="com.blog.common.DataConverter" %>
<%@ page import="com.blog.model.CommentInfo" %>
<%@ page import="com.blog.dal.Comment" %>
<%
	int id = DataConverter.toInt(request.getParameter("id"));
	Blog blog = new Blog();
	BlogInfo info = blog.getBlogInfo(id);
	if(info == null){
		out.println("<script>alert('博文ID有误');window.location.href('index.jsp');</script>");
	}
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">		
    
    <title>My JSP 'index.jsp' starting page</title>
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
  	 <div class="post">
  	 	<h1 class="title"><%=info.getTitle() %></a></h1>
  	 	<p class="byline"><small><%=info.getCreatedtime() %></small></p>
  	 	<div class="entry">
  	 		<p><%=DataValidator.serverHtmlDecode(info.getContext()) %></p>
  	 	</div>
  	 	<p class="meta"><a href="#" class="more">分类：<%=info.getClassName() %></a></p>
  	 	<%
  	 		Comment comment = new Comment();
  	 		List<CommentInfo> cmlist = comment.getListByBlogId(id);
  	 		for(CommentInfo cminfo:cmlist){
  	 			out.println(cminfo.getContext()+"<br>");
  	 			out.println(cminfo.getCreatedtime()+"&nbsp;&nbsp;"+cminfo.getUsername()+"<br><hr>");
  	 		}
  	 	 %>
  	 	 <jsp:include page="comment.jsp">
  	 	 <jsp:param value="<%=ud %>" name="id"/>
  	 	 </jsp:include>
  	 </div>
  	</article>
   	<aside id="sidebar">
   		<ul>
   			<li>
   				<h2>日志分类</h2>
   				<ul>
   				<%for(ClassInfo cinfo : clist) {%>
   					<li><a href="blog-edit.jsp?classId=<%=cinfo.getId() %>"><%=cinfo.getName() %></a></li>
   				<%} %>
   				</ul>
   			</li>
   		</ul>
   	</aside>
  </body>
</html>
