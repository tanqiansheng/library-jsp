<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="shortcut icon" href="/books/favicon.ico"  type="image/x-icon"/>
	<link rel="stylesheet" href="/books/css/common.css">
	<link rel="stylesheet" href="/books/css/temple.css">
	<link rel="stylesheet" href="/books/css/login.css">
	<script type="text/javascript" src="/books/jQuery/jquery-1.5.1.js"></script>
	<script type="text/javascript" src="/books/js/login.js"></script>
	<title>图书管理登录系统</title>
</head>
<script type="text/javascript">
	eval("${alert}");
</script>
<body>
	<!-- 顶部 B -->
	<div class="top">
		<!-- <div class="center top_c">你好，欢迎来到谭茜升的图上商城！</div> -->
		<div class="center top_c"><marquee behavior="scroll" direction="left" loop="-1" scrollamount="6" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()" style="font-size: 30px;color: red">你好，欢迎来到谭茜升的图书管理系统！</marquee></div>
	</div>
	<!-- 顶部 E -->
	<!-- logo B -->
	<div class="logo">
		<div class="center l_c">
			<div class="l_left fl">
				<h1>
					<a href="#">图书管理</a>
				</h1>
			</div>
			<div class="l_center fl">
				<input class="txt fl" type="text" placeholder="请输入图书"> 
				<input class="btn fl" type="button" value="搜索">
			</div>
			<div class="l_right fr">
				<ul>
					<li><b></b><a href="#">QQ注册</a></li>
					<li><b class="sina"></b><a href="#">微博登录</a></li>
					<li><input type="button" value="注册" onclick="window.open('/books/jsps/user/regist.jsp')"></li>
					<li><input type="button" value="登录" onclick="window.open('/books/jsps/user/login.jsp')"></li>
				
				</ul>
			</div>
		</div>
	</div>
	<!-- logo E -->
	<!-- 内容 B -->


	<div class="main center">
		<div class="m_left fl">
			<img src="/books/images/cookie.png" width="500px" height="400px" alt="">
		</div>
		<div class="m_right fr">
			<h2>图书管理</h2>
			<span style="color: red ; font-size: 20px;" >${msg}</span>
				
			<form action="<c:url value='/UserServlet'/>" method="post" id="loginForm">
			<input type="hidden" name="method" value="login">
			<div class="uName_pwd">
				<input class="txt" type="text"  id="loginname" name="loginname" value="谭茜升"> <label id="loginnameError" class="error" ></label>
				<input class="btn" type="password" id="loginpass" name="loginpass" value="123"> <label id="loginpassError" class="error"></label>
			</div>
			<div class="remember">
				<span class="fl"><input type="checkbox">自动登录</span>
				
				<!-- <a class="fr" href="#">忘记密码?</a> -->
			</div>
			<div>
				<input type="submit" class="loginBtn" value="登&nbsp;&nbsp;&nbsp;&nbsp;录" >
			</div>
			</form>
			<p class="other">
				其它方式
			</p>
			<ul class="login_type">
				<li class="fl"><a href="#">QQ登录</a></li>
				<li class="fl l_t_c"><a href="#">微博登录</a></li>
				<li class="fr"><a href="#">邮箱注册</a></li>
			</ul>
		
			
			
		</div>
	</div>



	<!-- 内容 E -->
	<!-- 底部 B -->
	<div class="foot">
		<div class="f_border">
			<div>
				<b class="b1"></b>
				<b class="b2"></b>
				<b class="b3"></b>
				<b class="b4"></b>
			</div>
			<div class="center">
				<div class="f_left fl">
					<ul>
						<li>中国，最大的图书商城 <span class="fz14"><span class="cRed">800,000</span> 藏</span></li>
						<li>每月，用户访问数量 <span class="fz14"><span class="cRed">20,000,000</span> 次</span></li>
						<li>每年，图书被浏览量 <span class="fz14"><span class="cRed">36,000,000,000</span>次</span></li>
						<li>现在，这些数字还在不断的增长着，欢迎您来一起光临本图书商城！</li>
					</ul>
				</div>
				<!-- <div class="f_right fr">
					<ul>
						<li>
							<a href="#">
								<s></s>
								<span>点击进入<br/>图书商城微博官网</span>
							</a>
						</li>
						<li>
							<a href="#">
								<s></s>
								<span>点击进入<br/>图书商城微博官网</span>
							</a>
						</li>
						<li>
							<a href="#">
								<s></s>
								<span>点击进入<br/>图书商城微博官网</span>
							</a>
						</li>
						<li>
							<a href="#">
								<s></s>
								<span>点击进入<br/>图书商城微博官网</span>
							</a>
						</li>
					</ul>
				</div> -->

				<div class="f_left fr">
					<ul>
						<li>地址：重庆大学城重庆市城市职业管理职业学院｜ 邮编： <span class="fz14"><span class="cRed">401331</span> </span></li>
						<li>版权：软件技术A1803<span class="fz14"><span class="cRed">  谭茜升</span> </span></li>
						<li>咨询电话：18580094819 ｜ 建议使用 <span class="fz14"><span class="cRed"> IE8.0</span>浏览器</span></li>
						<li>copyright @2018-2021 LIBRARY STROE</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 底部 E -->
</body>
</html>