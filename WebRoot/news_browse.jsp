<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.inews.entity.*"%>
<%@page import="com.inews.utils.DbCRUD"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("gbk");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<%		String nid =(String)request.getAttribute("nid");
		//通过nid查询对应的news里面的内容
 DbCRUD db = new DbCRUD();
	String query = "SELECT * FROM news where newsid=?;";
		int value = Integer.parseInt(nid);
		ArrayList<Map<String, Object>> data = (ArrayList<Map<String, Object>>) db.query(query, value);
		News news = new News();
		int count = 0;
		for (Map<String, Object> map : data) {
			Set<String> set = map.keySet();
			Iterator<String> it = set.iterator();
			while (it.hasNext()) {
				String name = (String) it.next();
				if(name.equals("newstitle")){
					news.setNewsTitle((String)map.get(name));
					//System.out.println(map.get(name));
				}
				if(name.equals("newsbody")){
					news.setNewsBody((String)map.get(name));
					//System.out.println(map.get(name));
				}
				if(name.equals("newsimage")){
					news.setNewsImage((String)map.get(name));
					//System.out.println(map.get(name));
				}
				if(name.equals("newsvideo")){
					news.setNewsVideo((String)map.get(name));
					//System.out.println(map.get(name));
				}
				if(name.equals("newsdate")){
					news.setNewsDate((String)map.get(name));
					//System.out.println(map.get(name));
				}
				if(name.equals("userid")){
					news.setNewsAuthor((String)map.get(name));
					//System.out.println(map.get(name));
				}
				if(name.equals("newsid")){
					news.setNewsId((Integer)map.get(name));
					//System.out.println(map.get(name));
				}
				count++;
			}

		}
		//System.out.println(news.getNewsTitle());
		//通过newsid查询对应的comment里面的commentbody
		String query2 = "SELECT * FROM comment where newsid=?;";
		ArrayList<Map<String, Object>> data2 = (ArrayList<Map<String, Object>>) db.query(query2, value);
 %>
 
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
		function validate(){
			var ar = document.forms[0].content1.value;
			if(!ar){
				alert("不能为空!");
			}
		}
	</script>
	<title>主页</title>
</head>
<link rel="stylesheet" type="text/css" href="./static/css/index.css">
<body>
	<div class="header">
		<div class="img1">&nbsp; 
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
	
	<div id="content">
	
		<div id="head"><font size="15px"><%= news.getNewsTitle() %></font><br/>时间:<%=news.getNewsDate() %>，作者：<%=news.getNewsAuthor() %></div>
		
		<div id="imgword" align="center">
		图像<% if(news.getNewsImage()!="" && news.getNewsImage()!=null){
			out.write("<img src='images/"+news.getNewsImage()+"' width='400px' height='500px' />");
		} %>
		<br/>
		视频<% if(news.getNewsImage()!="" && news.getNewsImage()!=null){
			out.write(" <video  width='400px' height='300px'  autoplay='autoplay' src='video/"+news.getNewsVideo()+"' controls='controls'> 	</video>");
		} %>
		



	
		文字<br/><%=news.getNewsBody() %></div>
		<br/>
		已评论区:
		
		<div>
			<% 
				for(int j=0;j < data2.size();j++){
  						Map<String ,Object>  map=data2.get(j);
			%>
<%=map.get("commentbody") %>
			<textarea style="width:1000px;height:200px;font: 1px solid red;"  >	</textarea>
			
			<% System.out.println(map.get("commentbody"));}
			%>
		</div>
		<br/>
	    <%=htmlData%>
	  <br/>  评论区：
		<form name="example" method="post" action="SubmitCommentServlet" onsubmit="return validate(this)">

			<div id="comment">
			<textarea name="content1" cols="100" rows="8" style="width:966px;height:200px;visibility:hidden;" onclick="method()"><%=htmlspecialchars(htmlData)%></textarea>
			<br />

			<input type="submit" name="button" value="提交评论" /> (提交快捷键: Ctrl + Enter)
			<input type="hidden" name="newsid" value="<%=news.getNewsId()%>"/>
			<input type="hidden" name="newsauthor" value="<%=request.getSession().getAttribute("userId")%>"/>
			</div>
		</form>	
		
	</div>
	
	
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

<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>