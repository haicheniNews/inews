<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page language="java" import="com.inews.entity.*"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>iNews 用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="static/css/register.css" rel='stylesheet' type='text/css' />
	<script type="application/x-javascript">
 	addEventListener(
			"load", function() 	{setTimeout(hideURLbar, 0); }, false);
			 function hideURLbar(){ window.scrollTo(0,1); } 
 	</script>
 	<script type="text/javascript" src ="./js/login.js"></script>
	<%
   if(request.getAttribute("user")==null){
     
	 String username=null;
    String password=null;
      
      Cookie[] cookies=request.getCookies();
      for(int i=0;cookies!=null&&i<cookies.length;i++){
      if(cookies[i].getName().equals("user")){
      username=cookies[i].getValue().split("-")[0];
      password=cookies[i].getValue().split("-")[1];
      }
   }
   if(username==null){
      username="";
   }
   if(password==null){
      password="";
   }
   	pageContext.setAttribute("user",new IdCard(username,password));
   }
 %>	

  </head>
  
  <body>
    <div class="center">
	<div class="main">
		<div class="header" >
			<h1>登录 iNews 帐户！</h1>
		</div>
		<p></p>
			<form action="<%=basePath %>LoginServlet" method="post">
				<ul class="right-form" >
					<h3>登录:</h3>
					<div>
						<li><input type="text" name ="username" class = "username" value="${user.userId}" placeholder="Username" required/></li>
						<li> <input type="password" name = "password" class = "password" value="${user.password}" placeholder="Password" required/></li>
						<h4><input type="checkbox" id="remember" name="remember" value="remember-me">记住密码</h4>
							<input type="submit" onClick="" value="登录" >
							<input type="button" onClick="" value="忘记密码" style="float" >
					</div>
					<div class="clear"> </div>
				</ul>
				<div class="clear"> </div>
				
				<div class="clear"> </div>
					
			</form>
			
		</div>
		</div>
  </body>
</html>
