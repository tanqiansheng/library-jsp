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
	<link rel="stylesheet" href="/books/css/regist.css">
	<script type="text/javascript" src="/books/jQuery/jquery-1.5.1.js"></script>
	<script type="text/javascript" src="/books/js/regist.js"></script>
<title>图书管理注册系统</title>
<script type="text/javascript">
		function change() {
			$("#imgVerifyCode").attr("src", "<c:url value='/VerifyCodeServlet?'/>" + new Date().getTime());
		}
		
</script>
</head>
<body>
<body>
	<!-- 顶部 B -->
	<div class="top">
<!-- 		<div class="center top_c">你好，欢迎来到谭茜升的图上商城！</div> -->
<div class="center top_c"><marquee behavior="scroll" direction="left" loop="-1" scrollamount="6" scrollamount="6" onmouseover="this.stop()" onmouseout="this.start()" style="font-size: 30px;color: red">你好，欢迎来到谭茜升的图书管理系统！</marquee></div>
	</div>
	<!-- 顶部 E -->
	<!-- logo B -->
	<div class="logo">
		<div class="center l_c">
			<div class="l_left fl">
				<h1>
					<a href="#">图书商城</a>
				</h1>
			</div>
			<div class="l_center fl">
				<input class="txt fl" type="text" placeholder="请输入图书" >
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
	
<!-- 中间注册start -->
<!-- <div style=""><img alt="" src="/books/images/regist.jpg" style="width: 400px;height: 250px;">
</div> -->
<div id="divMain" style="text-align: center;font-size: 20px; ">
  <div id="divTitle">
    <span id="spanTitle">新用户注册</span>
  </div>
  <div id="divBody">
<form action="<c:url value='/UserServlet'/>" method="post" id="registForm">
	<input type="hidden" name="method" value="regist"/>  
    <table id="tableForm">
      <tr>
        <td class="tdText">用户名：</td>
        <td class="tdInput">
          <input class="inputClass" type="text" name="loginname" id="loginname" value="${form.loginname }" placeholder="请输入用户名"/>
        </td>
        <td class="tdError">
          <label class="errorClass" id="loginnameError">${errors.loginname }</label>
        </td>
      </tr>
      <tr>
        <td class="tdText">登录密码：</td>
        <td>
          <input class="inputClass" type="password" name="loginpass" id="loginpass" value="${form.loginpass }" placeholder="请输入登录密码"/>
        </td>
        <td>
          <label class="errorClass" id="loginpassError">${errors.loginpass }</label>
        </td>
      </tr>
      <tr>
        <td class="tdText">确认密码：</td>
        <td>
          <input class="inputClass" type="password" name="reloginpass" id="reloginpass" value="${form.reloginpass }" placeholder="请输入确认密码"/>
        </td>
        <td>
          <label class="errorClass" id="reloginpassError">${errors.reloginpass}</label>
        </td>
      </tr>
      <tr>
        <td class="tdText">Email：</td>
        <td>
          <input class="inputClass" type="text" name="email" id="email" value="${form.email }" placeholder="请输入Email"/>
        </td>
        <td>
          <label class="errorClass" id="emailError">${errors.email}</label>
        </td>
      </tr>
      <tr>
        <td class="tdText">验证码：</td>
        <td>
          <input class="inputClass" type="text" name="verifyCode" id="verifyCode" value="${form.verifyCode }" placeholder="请输入验证码"/>
        </td>
        <td>
          <label class="errorClass" id="verifyCodeError">${errors.verifyCode}</label>
        </td>
      </tr>
      <tr>
        <td></td>
        <td>
          <div id="divVerifyCode"><img id="imgVerifyCode" src="<c:url value='/VerifyCodeServlet'/>"/></div>
        </td>
        <td>
          <label><a href="javascript:change()">换一张</a></label>
        </td>
      </tr>
      <tr>
        <td></td>
        <td>
          <input type="image" src="<c:url value='/images/regist1.jpg'/>" id="submitBtn"/>
        </td>
        <td>
          <label></label>
        </td>
      </tr>
    </table>
</form>    
  </div>
</div>

<!-- 中间注册end -->

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
						<li>现在，这些数字还在不断的增长着，欢迎您来一起光临本图上商城！</li>
					</ul>
				</div>
		<!-- 		<div class="f_right fr">
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
						<li>咨询电话：18580094819<span class="fz14"><span class="cRed">｜ 建议使用 IE8.0及以上</span>浏览器</span></li>
						<li>copyright @2018-2021 LIBRARY STROE</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 底部 E -->
</body>

</body>
</html>