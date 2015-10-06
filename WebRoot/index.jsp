<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
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
		<%String viewer; 
					if(request.getSession().getAttribute("userId")==null){viewer="login.jsp";}   //发布新闻的标题
					else{viewer="press_release.jsp";} %><a href="<%=viewer %>">发布新闻</a>
		
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
			
				<li><a href="index.jsp">首页</a></li>
				<li><a href="IndexToQuantityServlet?name=hot">热点</a></li>
				<li><a href="IndexToQuantityServlet?name=military">军事</a></li>
				<li><a href="IndexToQuantityServlet?name=amusement">娱乐</a></li>
				<li><a href="IndexToQuantityServlet?name=economic">经济</a></li>
				<li><a href="IndexToQuantityServlet?name=car">汽车</a></li>
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
		<%--
			<div class="news">
				<div class="title"><span>热点新闻 </span><a href="">查看更多</a> </div>
				<ul>
					<li>热点新闻 </li>
	<!-- 圈弟，这是具体实例  name=1代表传参数name，值为1被传到IndexToBrowseServlet。 标题需要从数据库里面取-->
				<li><a href="IndexToBrowseServlet?name=1">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
					<li><a href="#">这里是一条新闻</a></li>
				</ul>
			</div>
			
			<%String viewer2; 
					if(request.getSession().getAttribute("userId")==null){viewer2="login.jsp";}   //新闻投递状态（对所有人可见）
					else{viewer2="news_inspect.jsp";} %><a href="<%=viewer2 %>">新闻投递状态</a>				
		<%String viewer3; 
					if(request.getSession().getAttribute("userId")==null){viewer3="login.jsp";}   //新闻审核链接（对指定级别用户可见）
					else{viewer2="news_inspect2.jsp";} %><a href="<%=viewer2 %>">新闻审核链接</a>					
			--%>
			<c:forEach items="${index_my_list}" var="ilist" begin="0" end="5">
				<div class="news">
					<c:forEach items="${ilist}" var="tmp1" begin="0" end="0">
						<div class="title"><span>${tmp1.typename }</span><a href="">查看更多</a> </div>
					</c:forEach>
						<ul>
							<c:forEach items="${ilist}" var="tmp">
										<li><a href="IndexToBrowseServlet?name=${tmp.newsid }">${tmp.newstitle }</a></li>
							</c:forEach>
						</ul>
				</div>
			</c:forEach>
		</div>
		
		<div class="mright fr" style="margin-top: 10px;">
		
			<c:forEach items="${index_my_list_right}" var="ilist2">
				<div class="list">
					<div class="title"><span>头条</span> <a href=""></a> </div>
					
					<ul>
						<c:forEach items="${ilist2}" var="tmp2">
							<li><a href="IndexToBrowseServlet?name=${tmp2.newsid }">${tmp2.newstitle }</a></li>
						</c:forEach>
					</ul>
					</div>
				<div class="clear"></div>
			</c:forEach>
			
			<div class="list">
				<div class="title"><span>广告预留</span> <a href=""></a> </div>
				<ul>
					<li><a href="#">广告预留招商</a></li>
					<li><a href="#">广告预留招商</a></li>
					<li><a href="#">广告预留招商</a></li>
					<li><a href="#">广告预留招商</a></li>
					<li><a href="#">广告预留招商</a></li>
				</ul>
			</div>
			<div class="clear"></div>
	
			
		</div>
		
	</div>
	
	<div class="clear"></div>
	
	
	<br/>

	
	
	
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