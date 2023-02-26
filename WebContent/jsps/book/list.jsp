<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图书分类</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" type="text/css" href="<c:url value='/css/book/list.css'/>">
<script type="text/javascript" src="<c:url value='/jQuery/jquery-1.5.1.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/pager.css'/>" />
<script type="text/javascript" src="<c:url value='/jsps/pager.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/book/bookbase.css'/>" />
<script type="text/javascript" src="<c:url value='/js/book/list.js'/>"></script>
<script type="text/javascript">
	eval("${alert}");
</script>
<style type="text/css">

body{
	background:url("/books/images/add.jpg");
	background-repeat:no-repeat;
	background-size:100% 100%;
	background-attachment: fixed";
	color: #3c3938;
	margin: 0 auto;
	width: 1300px;
}
</style>
  </head>
  <body>
  <div class="center top_c"><marquee behavior="scroll" direction="left" loop="-1" scrollamount="6" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()" style="font-size: 30px;color: red">你好， 欢迎  ${sessionUser.loginname}   来到谭茜升的图书管理系统！</marquee></div>
  
<div>

	<div class="header">
		<div class="container">			
			<ul>
				<li><a href="/books/jsps/user/login.jsp">登录</a> <span>|</span></li>
				<li><a href="/books/jsps/user/regist.jsp">注册</a><span>|</span></li>
				<li ><a href="#">联系</a></li>
			</ul>
				<div class="clearfix"> </div>
			</div>
	</div>
	<div class="top-nav">

					<ul>
						<li class="active left"><a href="/books/BookServlet?method=findByCategory">首页</a></li>
						<li><a href="<c:url value='/jsps/book/add.jsp'/>"> 添加图书</a></li>
						<li><a href="<c:url value='/jsps/book/gj.jsp'/>">高级搜索</a></li>
						<li><a href="<c:url value='/UserServlet?method=quit'/>">退出登录</a></li>
						<li><a href="#">关于</a></li>
					</ul>
	</div>


	<p style="font-size: 20px; text-align: center; display: block; padding: 15px;"> 图书管理员： <span style="color: red; font-size: 30px;padding: 30px;">${sessionUser.loginname}</span><p>

</div>
<div class="divBook">
<a href=""></a>
<ul>
<c:forEach items="${pb.beanList }" var="book">
 <li>
  <div class="inner">
    <a class="pic" href="<c:url value='/BookServlet?method=load&bid=${book.bid }'/>"><img src="<c:url value='/${book.image_b }'/>" border="0"/></a>
    <p class="price" >
		<span class="price_n">&yen;${book.currPrice }</span>
		<span class="price_r">&yen;${book.price }</span>
		(<span class="price_s">${book.discount }折</span>)
	</p>
	<c:url value="/BookServlet" var="authorUrl">
		<c:param name="method" value="findByAuthor"/>
		<c:param name="author" value="${book.author }"/>
	</c:url>
	<c:url value="/BookServlet" var="pressUrl">
		<c:param name="method" value="findByPress"/>
		<c:param name="press" value="${book.press }"/>
	</c:url>
	<p><a id="bookname" title="${book.bname }" href="<c:url value='/BookServlet?method=load&bid=${book.bid }'/>">${book.bname }</a></p>
	<p><a href="${authorUrl }" name='P_zz' title='${book.author }'>${book.author }</a></p>
	<p class="publishing">
		<span>出版社：</span><a href="${pressUrl }">${book.press }</a>
	</p>
  </div>
 </li>
</c:forEach>
</ul>
</div>
<div style="float:left; width: 100%; text-align: center;">
	<hr/>
	<br/>
	<%@include file="/jsps/page/pager.jsp" %>
</div>

<div class="foot">
					<ul>
						<li>地址：重庆大学城重庆市城市职业管理职业学院｜ 邮编： <span class="fz14"><span class="cRed">401331</span> </span></li>
						<li>版权：软件技术A1803<span class="fz14"><span class="cRed">  谭茜升</span> </span></li>
						<li>咨询电话：18580094819 ｜ 建议使用 <span class="fz14"><span class="cRed"> IE8.0</span>浏览器</span></li>
						<li>copyright @2018-2021 LIBRARY STROE</li>
					</ul>
</div>
  </body>
 
</html>

