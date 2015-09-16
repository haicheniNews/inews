<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("gbk");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
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
	</script>
	<title>��ҳ</title>
</head>
<link rel="stylesheet" type="text/css" href="./static/css/index.css">
<body>
	<div class="header">
		<div class="img1">
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
	
		<div id="head">�����������ƣ�ʱ�䣬��Դ</div>
		
		<div id="imgword">ͼ����Ƶ������</div>
		
	    <%=htmlData%>
	    
		<form name="example" method="post" action="/iNews/SubmitServlet">
			<div id="comment">
			<textarea name="content1" cols="100" rows="8" style="width:966px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
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