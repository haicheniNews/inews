<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>iNews 用户注册</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="static/css/register.css" rel='stylesheet' type='text/css' />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/register_me.js"></script>
  </head>
  
  <body>
    <div class="center">
	<div class="main">
		<div class="header" >
			<h1>创建一个 iNews 帐户</h1>
		</div>
		<p></p>
			<form action="UserRegisterServlet?isRegister=1" method="post" onsubmit="return ischeck()">
				<ul class="left-form"  >
					<h2>新账户:</h2>
					<li>
						<input type="text" id="userId" name="userId" onchange="getUserInfo()"  placeholder="Username" required/><i id="info" style="display:none;float:right"><font size="2" color="red">用户名已存在</font></i>
						<a class="icon ticker" id="idicon" " ></a>
						<div class="clear"> </div>
					</li> 
					<li>
						<input type="text"  id="email" name="email" placeholder="Email" onchange="ischeckemail()" required/><i id="emailinfo" style="display:none;float:right"><font size="2" color="red">邮箱格式错误</font></i>
						<a class="icon ticker" id="emailicon"> </a>
						<div class="clear"> </div>
					</li> 
					<li>
						<input type="password" id="pwd" name="pwd" placeholder="password" required/>
						<a class="icon into" id="pwdicon1" > </a>
						<div class="clear"> </div>
					</li> 
					<li>
						<input type="password" id="pwd1" placeholder="password" onchange="ischeckpwd()"  required/><i id="pwdinfo" style="display:none;float:right"><font size="2" color="red">密码不一致</font></i>
						<a class="icon into" id="pwdicon" > </a>
						<div class="clear"> </div>
					</li> 
					<label class="checkbox"><input type="checkbox" onclick="ischeck()" id="checkbox" name="checkbox" checked=""><i> </i>同意我们的霸王条款.(Please ensure you agree  with our inequality imparity clause)</label>
					<input type="submit" value="创建账户">
						<div class="clear"> </div>
				</ul>
				
				<div class="clear"> </div>
					
			</form>
			
		</div>
		</div>
  </body>
</html>
