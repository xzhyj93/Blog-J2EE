<!-- page指令是针对当前页面的指令，作用于整个JSP。通常位于JSP的顶端，一个JSP可以有多条page指令，但是其属性只能出现一次，重复的属性设置将覆盖之前的设置 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.blog.model.BlogInfo" %>
<%@ page import="com.blog.dal.Blog" %>
<%@ page import="com.blog.common.DataValidator" %>
<%@ page import="com.blog.common.Utility" %>
<%@ page import="com.blog.dal.Class" %>
<%@ page import="com.blog.model.ClassInfo" %>
<%
/* 	JSP中的内建对象有：request, response, pageContext, session, application, out, config, page, exception等
	request对象封装了用户提交给服务器的所有信息，通过request对象可以获取用户提交的信息；
	response对象对客户的请求作出动态响应，向客户端发送数据；
	pageContext对象是一个页面上下文对象；
	session对象是指客户端与服务器的一次会话，从客户端连到服务器的一个WebApplication开始，直到客户端与服务器断开连接为止；
	application对象实现了用户间数据的共享，可存放全局变量，它开始于服务器的启动，直到服务器关闭结束。在此期间，此对象将一直存在；
	out对象是一个输出流，用来向客户端输出数据；
 */
 	/**
 	 * 解决相对路径的问题，返回站点根路径
 	 */
	String path = request.getContextPath();
	/**
	 * Scheme: http
	 * ServerName: laptop-sa4ktulu  即服务器名称
	 * ServerPort: 1234 服务器端口号
	 * path: /blog-j2ee
	*/
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	//System.out.println(basePath);
	//System.out.println("Scheme:"+request.getScheme()+"; ServerName:"+request.getServerName()+"; ServerPort:"+request.getServerPort()+"; path: "+path);

	Blog blog = new Blog();
	List<BlogInfo> list = blog.getList(null);
	
	//获取博文分类
	Class cls = new Class();
	List<ClassInfo> clist = cls.getList();
%>
<!-- JSP由HTML代码和嵌入其中的Java代码组成。服务器在页面被客户端请求后对这些Java代码进行处理，然后将生成的HTML页面返回给客户端的浏览器 -->
<!DOCTYPE HTML>
<html>
  <head>
  	<!-- JSP表达式  base标签用于指定该页面的绝对路径，这是由页面头部的java代码获得的。解决相对路径的问题-->
    <base href="<%=basePath%>">		
    
    <title>Hello, Blog!</title>
    <!-- meta元素提供有关页面的元信息，比如针对搜索引擎和更新频度的描述和关键词。它不包含任何内容，它的属性定义了与文档相关联的名称/值对 -->
	<!-- 元数据总是以名称/值的形式被成对传递的
		 http-equiv属性为名称/值对提供了名称。并指示服务器在发送实际的文档之前先在要传给浏览器的MINE文档头部包含名称/值对
		 使用带有 http-equiv 属性的 <meta> 标签时，服务器将把名称/值对添加到发送给浏览器的内容头部
		 content 属性提供了名称/值对中的值。该值可以是任何有效的字符串。
		 content 属性始终要和 name 属性或 http-equiv 属性一起使用。
	 -->
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="J2EE,Blog System">
	<meta http-equiv="description" content="This a index page into Blog System">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
  </head>
  
  <body>
  	<nav class="nav clear-fix">
  		<ul class="fl-right">
  			<li><a href="register.jsp">注册</a></li>
  			<li><a href="login.jsp">登录</a></li>
  		</ul>
  	</nav>
  	<article id="context">
  	<%
  		for(BlogInfo info : list) {//遍历输出list集合中的数据
  	 %>
  	 <div class="post">
  	 	<h1 class="title"><a href="blog-information.jsp?id=<%=info.getId() %>"><%=info.getTitle() %></a></h1>
  	 	<p class="byline"><small><%=info.getCreatedtime() %></small></p>
  	 	<div class="entry">
  	 		<p><%=Utility.substring(DataValidator.removeHtml(info.getContext()), 300) %></p>
  	 	</div>
  	 	<p class="meta"><a href="#" class="more">分类：<%=info.getClassName() %></a> &nbsp;&nbsp;<a href="blog-information.jsp?id=<%=info.getId() %>#comment" class="comments">我要评论</a></p>
  	 </div>
  	 <%
  	 	}
  	  %>
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
