<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图书管理添加图书系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="shortcut icon" href="/books/favicon.ico"  type="image/x-icon"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/book/add.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/jQuery/jquery.datepick.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/book/bookbase.css'/>" />
<script type="text/javascript" src="<c:url value='/jQuery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jQuery/jquery.datepick.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jQuery/jquery.datepick-zh-CN.js'/>"></script>
<script type="text/javascript">
$(function () {
	$("#publishtime").datepick({dateFormat:"yy-mm-dd"});
	$("#printtime").datepick({dateFormat:"yy-mm-dd"});
	
	$("#btn").addClass("btn1");
	$("#btn").hover(
		function() {
			$("#btn").removeClass("btn1");
			$("#btn").addClass("btn2");
		},
		function() {
			$("#btn").removeClass("btn2");
			$("#btn").addClass("btn1");
		}
	);
	
	$("#btn").click(function() {
		var bname = $("#bname").val();
		var currPrice = $("#currPrice").val();
		var price = $("#price").val();
		var discount = $("#discount").val();
		var author = $("#author").val();
		var press = $("#press").val();
		var pid = $("#pid").val();
		var cid = $("#cid").val();
		var image_w = $("#image_w").val();
		var image_b = $("#image_b").val();
		
		if(!bname || !currPrice || !price || !discount || !author || !press || !image_w || !image_b) {
			alert("图名、当前价、定价、折扣、作者、出版社、大图、小图都不能为空！");
			return false;
		}
		
		if(isNaN(currPrice) || isNaN(price) || isNaN(discount)) {
			alert("当前价、定价、折扣必须是合法小数！");
			return false;
		}
		$("#form").submit();
	});
});



</script>
<style type="text/css">
body{	
	margin: 0 auto;
	width: 1300px;
	background:url("/books/images/add.jpg");
	background-repeat:no-repeat;
	background-size:100% 100%;
	background-attachment: fixed";
	color: #3c3938;
	
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
  <div>
   <p style="font-weight: 900; color: red;">${msg }</p>
   <form action="<c:url value='/AddBookServlet'/>" enctype="multipart/form-data" method="post" id="form">
    <div>
	    <ul>
	    	<li>书名：　<input id="bname" type="text" name="bname" value="Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）" style="width:500px;"/></li>
	    	<li>大图：　<input id="image_w" type="file" name="image_w"/></li>
	    	<li>小图：　<input id="image_b" type="file" name="image_b"/></li>
	    	<li>当前价：<input id="currPrice" type="text" name="currPrice" value="40.7" style="width:50px;"/></li>
	    	<li>定价：　<input id="price" type="text" name="price" value="59.0" style="width:50px;"/>
	    	折扣：<input id="discount" type="text" name="discount" value="6.9" style="width:30px;"/>折</li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table>
			<tr>
				<td colspan="3">
					作者：　　<input type="text" id="author" name="author" value="Craig Walls" style="width:150px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					出版社：　<input type="text" name="press" id="press" value="人民邮电出版社" style="width:200px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">出版时间：<input type="text" id="publishtime" name="publishtime" value="2013-6-1" style="width:100px;"/></td>
			</tr>
			<tr>
				<td>版次：　　<input type="text" name="edition" id="edition" value="1" style="width:40px;"/></td>
				<td>页数：　　<input type="text" name="pageNum" id="pageNum" value="374" style="width:50px;"/></td>
				<td>字数：　　<input type="text" name="wordNum" id="wordNum" value="48700" style="width:80px;"/></td>
			</tr>
			<tr>
				<td width="250">印刷时间：<input type="text" name="printtime" id="printtime" value="2013-6-1" style="width:100px;"/></td>
				<td width="250">开本：　　<input type="text" name="booksize" id="booksize" value="16" style="width:30px;"/></td>
				<td>纸张：　　<input type="text" name="paper" id="paper" value="胶版纸" style="width:80px;"/></td>

			<tr>
				<td>
					<input type="button" id="btn" class="btn" value="新书上架">
				</td>
				<td></td>
				<td></td>
			</tr> 
		</table>
	</div>
   </form>
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
