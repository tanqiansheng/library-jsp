<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图书管理图书高级搜索系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="/books/favicon.ico"  type="image/x-icon"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/book/bookbase.css'/>" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	table {
		color: #404040;
	}
	body{
	background:url("/books/images/gj.jpg");
	background-repeat:no-repeat;
	background-size:100% 100%;
	background-attachment: fixed";
	color: #3c3938;
	margin: 0 auto;
	width: 1300px;
	font-size: 13px;
	}
	.input{
	width:500px;
	height:50px;
	margin: 30px;
	}
	.btn{
		width: 80px;
		height: 30px;
		margin-left: 120px;
	}
</style>
  </head>
  
  <body>
  <div class="center top_c"><marquee behavior="scroll" direction="left" loop="-1" scrollamount="6" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()" style="font-size: 30px;color: red">你好， 欢迎  ${sessionUser.loginname}   来到谭茜升的图书管理系统！</marquee></div>
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
  
	  <form action="<c:url value='/BookServlet'/>" method="get">
  	<input type="hidden" name="method" value="findByCombination"/>
  
<table align="center">

	<tr>
		<td>书名：</td>
		<td><input type="text" name="bname" class="input" placeholder="请输入你需搜索的图书书名"/></td>
	</tr>
	<tr>
		<td>作者：</td>
		<td><input type="text" name="author" class="input" placeholder="请输入你需搜索的图书作者"/></td>
	</tr>
	<tr>
		<td>出版社：</td>
		<td><input type="text" name="press" class="input" placeholder="请输入你需搜索的图书出版社"/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<input type="submit" value="搜　　索" class="btn"/>
			<input type="reset" value="重新填写" class="btn"/><br>
			<!-- <button onclick="window.open((jsps.main.jsp))" style="width: 50px; height: 30px;">首页</button> -->
		
		</td>
	</tr>
</table>
	</form>
				
  </body>
  <div class="foot">
					<ul>
						<li>地址：重庆大学城重庆市城市职业管理职业学院｜ 邮编： <span class="fz14"><span class="cRed">401331</span> </span></li>
						<li>版权：软件技术A1803<span class="fz14"><span class="cRed">  谭茜升</span> </span></li>
						<li>咨询电话：18580094819 ｜ 建议使用 <span class="fz14"><span class="cRed"> IE8.0</span>浏览器</span></li>
						<li>copyright @2018-2021 LIBRARY STROE</li>
					</ul>
</div>
</html>
