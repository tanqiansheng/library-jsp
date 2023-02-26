<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图书管理分页图书系统</title>
    
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
<link rel="stylesheet" type="text/css" href="<c:url value='/css/book/desc.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/jQuery/jquery.datepick.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/book/bookbase.css'/>" />
<script type="text/javascript" src="<c:url value='/jQuery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jQuery/jquery.datepick.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jQuery/jquery.datepick-zh-CN.js'/>"></script>

<script type="text/javascript" src="<c:url value='/js/book/desc.js'/>"></script>

<script type="text/javascript">

$(function() {
	$("#box").attr("checked", false);
	$("#formDiv").css("display", "none");
	$("#show").css("display", "");	
	
	// 操作和显示切换
	$("#box").click(function() {
		if($(this).attr("checked")) {
			$("#show").css("display", "none");
			$("#formDiv").css("display", "");
		} else {
			$("#formDiv").css("display", "none");
			$("#show").css("display", "");		
		}
	});
});

</script>
<style type="text/css">
body{
	margin: 0 auto;
	width: 1300px;
	background:url("/books/images/desc.jpg");
	background-repeat:no-repeat;
	background-size:100% 100%;
	background-attachment: fixed";
	color: #3c3938;
	
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
  
    <input type="checkbox" id="box"><label for="box">编辑或删除</label>
    <br/>
    <br/>
  <div id="show">
    <div class="sm">${book.bname }</div>
    <img align="top" src="<c:url value='/${book.image_w }'/>" class="tp"/>
    <div id="book" style="float:left;">
	    <ul>
	    	<li>商品编号：${book.bid }</li>
	    	<li>当前价：<span class="price_n">&yen;${book.currPrice }</span></li>
	    	<li>定价：<span style="text-decoration:line-through;">&yen;${book.price }</span>　折扣：<span style="color: #c30;">${book.discount }</span>折</li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table class="tab">
			<tr>
				<td colspan="3">
					作者：${book.author }著
				</td>
			</tr>
			<tr>
				<td colspan="3">
					出版社：${book.press }</a>
				</td>
			</tr>
			<tr>
				<td colspan="3">出版时间：${book.publishtime }</td>
			</tr>
			<tr>
				<td>版次：${book.edition }</td>
				<td>页数：${book.pageNum }</td>
				<td>字数：${book.wordNum }</td>
			</tr>
			<tr>
				<td width="180">印刷时间：${book.printtime }</td>
				<td>开本：${book.booksize }开</td>
				<td>纸张：${book.paper }</td>
			</tr>
		</table>
	</div>
  </div>
  
  
  <div id='formDiv'>
   <div class="sm">&nbsp;</div>
   <form action="BookServlet" method="post" id="form">
   	<input type="hidden" name="bid" value="${book.bid }"/>

    <img align="top" src="<c:url value='/${book.image_w }'/>" class="tp"/>
    <div style="float:left;">
	    <ul>
	    	<li>商品编号：${book.bid }</li>
	    	<li>书名：　<input id="bname" type="text" name="bname" value="${book.bname }" style="width:500px;"/></li>
	    	<li>当前价：<input id="currPrice" type="text" name="currPrice" value="${book.currPrice }" style="width:50px;"/></li>
	    	<li>定价：　<input id="price" type="text" name="price" value="${book.price }" style="width:50px;"/>
	    	折扣：<input id="discount" type="text" name="discount" value="${book.discount }" style="width:30px;"/>折</li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table class="tab">
			<tr>
				<td colspan="3">
					作者：　　<input id="author" type="text" name="author" value="${book.author }" style="width:150px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					出版社：　<input id="press" type="text" name="press" value="${book.press }" style="width:200px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">出版时间：<input id="publishtime" type="text" name="publishtime" value="${book.publishtime }" style="width:100px;"/></td>
			</tr>
			<tr>
				<td>版次：　　<input id="edition" type="text" name="edition" value="${book.edition }" style="width:40px;"/></td>
				<td>页数：　　<input id="pageNum" type="text" name="pageNum" value="${book.pageNum }" style="width:50px;"/></td>
				<td>字数：　　<input id="wordNum" type="text" name="wordNum" value="${book.wordNum }" style="width:80px;"/></td>
			</tr>
			<tr>
				<td width="250px">印刷时间：<input id="printtime" type="text" name="printtime" value="${book.printtime }" style="width:100px;"/></td>
				<td width="250px">开本：　　<input id="booksize" type="text" name="booksize" value="${book.booksize }" style="width:30px;"/></td>
				<td>纸张：　　<input id="paper" type="text" name="paper" value="${book.paper }" style="width:80px;"/></td>
			</tr>
		
			<tr>
				<td colspan="2">
					<input onclick="editForm()" type="button" name="method" id="editBtn" class="btn" value="编　　辑">
					<input onclick="delForm()" type="button" name="method" id="delBtn" class="btn" value="删　　除">
				</td>
				<td></td>
			</tr>
		</table>
	</div>
   </form>
  </div>

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
