<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.inews.entity.*"%>
<%@page import="com.inews.utils.DbCRUD,com.inews.utils.StringUtils"%>
<%@page import="java.io.File"%>
<!-- 
某一具体新闻详情展示页面
@author  weipeng
 -->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("gbk");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
String imgPath=request.getContextPath();//request.getSession().getServletContext().getRealPath("/");
%>
<%	
String userid = (String)request.getSession().getAttribute("userId");
if(userid == null){
	userid = "游客";
}
	String nid =(String)request.getParameter("nid");
		//通过nid查询对应的news里面的内容
 DbCRUD db = new DbCRUD();
	String query = "SELECT * FROM news where newsid=?";
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
		function validate(e){
			var va = document.getElementById("form1");
			if(!va["content1"].value){
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
		

　　 var checksubmitflg = false;
　　 function checksubmit(e) {
　　 if (checksubmitflg == true) {
　　 return false;
　　 }
　　 checksubmitflg = true;
　　 return true;
　　 }
　　 document.ondblclick = function docondblclick() {
　　 window.event.returnvalue = false;
　　 }
　　 document.onclick = function doconclick() {
　　 if (checksubmitflg) {
　　 window.event.returnvalue = false;
　　 }
　　 }

	</script>
	<title>新闻浏览界面</title>
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
	
	<div id="content">
	
		<div id="head"><h2><%= news.getNewsTitle() %></h2><br/>时间:<%=news.getNewsDate() %>，作者：<%=news.getNewsAuthor() %></div>
		
		<div id="imgword" align="center">
		<% if(news.getNewsImage()!="" && news.getNewsImage()!=null){
			String imgpath=(String)session.getAttribute("img_path");//data
			//out.write("<img src="+imgpath+File.separator+"images"+File.separator+news.getNewsImage()+"/>");
			out.write("<img src="+imgPath+"/"+"upload/images"+"/"+data.get(0).get("newsimage")+">");
		} %>
		<br/>
		<% if(news.getNewsVideo()!="" && news.getNewsVideo()!=null){
			out.write("<video  width='400px' height='300px'  autoplay='autoplay' src='"+imgPath+"/upload/video/"+news.getNewsVideo()+"' controls='controls'> 	</video>");
		} %>
		</div>
		
		<div style="text-align: left;">
			<p>
				&nbsp;&nbsp;&nbsp;<%=news.getNewsBody() %>
			</p>
		</div>
		
		</div>
		<div class="clear"></div>


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