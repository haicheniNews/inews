<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-ch">
<head>
	<title>主页</title>
</head>
<link rel="stylesheet" type="text/css" href="./static/css/index.css">
<body>
	<div class="header">
		<div class="img1">
			<img src="static/images/logo.jpg" alt="logo">
		</div>
		<div class="button">
		<c:if test="${sessionScope.userId==null}"> 
			<a href="login.jsp">登陆</a>
			<a href="register.jsp">注册</a> 
		</c:if>
		<c:if test="${sessionScope.userId!=null}">
			<a href='userinfo.jsp'> <c:out value="welcome:${sessionScope.userId}"></c:out> </a>
			<a href="LogoutServlet" style="margin:0 0;padding 0 0;"><font size="1px">注销</font></a>
		</c:if>
			
		</div>	
	</div>
	<div class="nav">
		<div class="title fl">
			<ul>
				<li><a href="#">首页</a></li>
				<li><a href="#">热点</a></li>
				<li><a href="#">军事</a></li>
				<li><a href="#">娱乐</a></li>
				<li><a href="#">经济</a></li>
				<li><a href="#">汽车</a></li>
			</ul>
		</div>	

			<div class="search fr">
				<form action="url"><input type="text">&nbsp;<input type="submit" value="搜索">&nbsp;</form>
			</div>
		
	</div>
	
	<div class="content">
		<a href="" class="item"></a>
		
	</div>
	
	<div class="clear"></div>
	
	<div class="mainbody">
		<div class="mleft fl">
			<div class="news">
				<div class="title"><span>热点新闻 </span><a href="">查看更多</a> </div>
				<ul>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
				</ul>
			</div>
			<div class="news">
				<div class="title"><span>热点新闻 </span><a href="">查看更多</a> </div>
				<ul>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
				</ul>
			</div>
			
			<div class="news">
				<div class="title"><span>热点新闻 </span><a href="">查看更多</a> </div>
				<ul>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
				</ul>
			</div>
			
			<div class="news">
				<div class="title"><span>热点新闻 </span> <a href="">查看更多</a> </div>
				<ul>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
				</ul>
			</div>
						<div class="news">
				<div class="title"><span>热点新闻 </span><a href="">查看更多</a> </div>
				<ul>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
				</ul>
			</div>
			<div class="news">
				<div class="title"><span>热点新闻 </span><a href="">查看更多</a> </div>
				<ul>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
				</ul>
			</div>
			
			<div class="news">
				<div class="title"><span>热点新闻 </span><a href="">查看更多</a> </div>
				<ul>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
				</ul>
			</div>
			
			<div class="news">
				<div class="title"><span>热点新闻 </span> <a href="">查看更多</a> </div>
				<ul>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
				</ul>
			</div>

		</div>
		
		<div class="mright fr">
			<div class="list">
				<div class="title"><span>头条</span> <a href="">查看更多</a> </div>
				<ul>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
				</ul>
			</div>
			<div class="clear"></div>
			<div class="list">
				<div class="title"><span>排行版</span> <a href="">查看更多</a> </div>
				<ul>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
				</ul>
			</div>
			<div class="clear"></div>
			<div class="list">
				<div class="title"><span>排行版</span> <a href="">查看更多</a> </div>
				<ul>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
				</ul>
			</div>
			
		</div>
		
	</div>
	
	<div class="clear"></div>
	
	
	

	
	
	
	<div class="footer" >
				 <div id="site_nav">
				    <ul>
				      <li><a href="/index/service">广告服务</a></li>
				      <li><a href="/index/contactus">联系我们</a></li>
				      <li ><a href="/index/friend_links">友情链接:</a></li>
				      <li ><a href="#">百度</a></li>
				  	  <li ><a href="#">搜狐</a></li>
					  <li ><a href="#">谷歌</a></li>
					  <li class="last" ><a href="#">新浪</a></li>
				    </ul>
				  </div>
				 
				  <div id="copyright">
				    &copy; 2003-2015 ITeye.com.    [ <a href="http://www.miibeian.gov.cn">京ICP证110151号</a>  京公网安备110105010620 ]<br/>
				    iNews(北京)投资有限公司  版权所有<br />
				  </div>
	</div>


</body>

</html>