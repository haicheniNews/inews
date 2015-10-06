<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";

%>
<%
String userid = (String)request.getSession().getAttribute("userId");


 %>
<!-- 
新闻发布界面 可发布具体内容（视频，图像，文字）
@author  weipeng
 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-ch">
<head>

	<link rel="stylesheet" href="editor/themes/default/default.css" />
	<link rel="stylesheet" href="editor/plugins/code/prettify.css" />
	<script charset="utf-8" src="editor/kindeditor.js"></script>
	<script charset="utf-8" src="editor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="editor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : 'editor/plugins/code/prettify.css',
				uploadJson : 'editor/jsp/upload_json.jsp',
				fileManagerJson : 'editor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
		function validate(e){
			var va = document.getElementById("form1");
			if(!va["title"].value || !va["content1"].value){
				alert("您还没有输入值！");
				return false;
			}else{
				if(va["content1"].value.length<12){
					alert("编辑内容不少于12个字！");
					return false;
				}else{
					return true;				
				}

			}
			
		}
	</script>

	<title>新闻发布界面 </title>
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
			<c:out value="welcome:${sessionScope.userId}"></c:out>
			<a href="LogoutServlet" style="margin:0 0;padding 0 0;"><font size="1px">注销</font></a>
		</c:if>
			
		</div>	
	</div>
	<div class="nav">
		<div class="title fl">
			<ul>
				<li><a href="index.jsp">首页</a></li>
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
	
	<%=htmlData%>
	<form method="post"  action="SubmitServlet"  enctype="multipart/form-data"  onsubmit="return validate(event)">
		<br/>请输入标题：
		<input name="title" type="text" style="width:300px;height:30px;"/>
						&nbsp;&nbsp;&nbsp;&nbsp;请选择类别：				
		<input type="radio" value="热点" name="checkbox" />热点
		<input type="radio" value="军事"  name="checkbox" />军事   
		<input type="radio" value="娱乐"  name="checkbox"/>娱乐
		<input type="radio" value="经济"  name="checkbox" />经济
		<input type="radio" value="汽车"  name="checkbox"/>汽车			
					<br/>
		<div id="comment" style="width:966px;height:400px;margin-left:0px;margin-top:20px;margin-bottom:20px;">
		<textarea id="content1" name="content1" cols="100" rows="8" style="width:966px;height:300px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
		<input type="hidden" name="userid" value="<%=userid %>">
		<br/>
        	上传图片：<input type="file" name="file1"><br/><br/>
        	上传视频：<input type="file" name="file2"><br/><br/>
		
		<input type="submit" name="button" value="提交内容" /><!--  (提交快捷键: Ctrl + Enter) -->
		</div>
		
	</form>
<br/>

	<div class="footer" style="margin-top:2px;" >
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

<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>