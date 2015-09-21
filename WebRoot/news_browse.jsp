<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.inews.entity.*"%>
<%@page import="com.inews.utils.DbCRUD"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("gbk");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<% DbCRUD db = new DbCRUD();
	String query = "SELECT * FROM news where newsid=?;";
		int value = 1;
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

				count++;
			}

		}
		//System.out.println(news.getNewsTitle());
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
				alert("����Ϊ��!");
			}
		}
	</script>
	<title>��ҳ</title>
</head>
<link rel="stylesheet" type="text/css" href="./static/css/index.css">
<body>
	<div class="header">
		<div class="img1">&nbsp; 
			<img src="static/images/logo.jpg" alt="logo">
		</div>
		<div class="button">
		<c:if test="${sessionScope.userId==null}"> 
			<a href="login.jsp">��½</a>
			<a href="register.jsp">ע��</a> 
		</c:if>
		<c:if test="${sessionScope.userId!=null}">
			<c:out value="welcome:${sessionScope.userId}"></c:out>
			<a href="LogoutServlet" style="margin:0 0;padding 0 0;"><font size="1px">ע��</font></a>
		</c:if>
			
		</div>	
	</div>
	<div class="nav">
		<div class="title fl">
			<ul>
				<li><a href="#">��ҳ</a></li>
				<li><a href="#">�ȵ�</a></li>
				<li><a href="#">����</a></li>
				<li><a href="#">����</a></li>
				<li><a href="#">����</a></li>
				<li><a href="#">����</a></li>
			</ul>
		</div>	

			<div class="search fr">
				<form action="url"><input type="text">&nbsp;<input type="submit" value="����">&nbsp;</form>
			</div>
		
	</div>
	
	<div id="content">
	
		<div id="head">������������<%= news.getNewsTitle() %>��ʱ�䣬��Դ</div>
		
		<div id="imgword" align="center">
		ͼ��<% if(news.getNewsImage()!=null){
			out.write("<img src='images/"+news.getNewsImage()+"' width='400px' height='500px' />");
		} %>
		<br/>
		��Ƶ<% if(news.getNewsImage()!=null){
			out.write(" <video  width='400px' height='300px'  autoplay='autoplay' src='video/"+news.getNewsVideo()+"' controls='controls'> 	</video>");
		} %>
		



	
		����<br/><%=news.getNewsBody() %></div>
		
	    <%=htmlData%>
	    ��������
		<form name="example" method="post" action="/iNews/SubmitServlet" onsubmit="return validate(this)">

			<div id="comment">
			<textarea name="content1" cols="100" rows="8" style="width:966px;height:200px;visibility:hidden;" onclick="method()"><%=htmlspecialchars(htmlData)%></textarea>
			<br />

			<input type="submit" name="button" value="�ύ����" /> (�ύ��ݼ�: Ctrl + Enter)
			<input type="hidden" name="username"/>
			</div>
		</form>	
		
	</div>
	
	
	<div class="footer" >
				 <div id="site_nav">
				    <ul>
				      <li><a href="/index/service">������</a></li>
				      <li><a href="/index/contactus">��ϵ����</a></li>
				      <li ><a href="/index/friend_links">��������:</a></li>
				      <li ><a href="#">�ٶ�</a></li>
				  	  <li ><a href="#">�Ѻ�</a></li>
					  <li ><a href="#">�ȸ�</a></li>
					  <li class="last" ><a href="#">����</a></li>
				    </ul>
				  </div>
				 
				  <div id="copyright">
				    &copy; 2003-2015 ITeye.com.    [ <a href="http://www.miibeian.gov.cn">��ICP֤110151��</a>  ����������110105010620 ]<br/>
				    iNews(����)Ͷ�����޹�˾  ��Ȩ����<br />
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