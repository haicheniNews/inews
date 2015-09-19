<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update_menu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<style type="text/css">
		.left_label{
			border:0px;
			margin:0px;
			padding:0px;
			text-align: right;
		}
	</style>
	<script type="text/javascript" src="<%=basePath%>js/ajax.js"></script>

  </head>
  
  <body>
    		<p>菜单修改:</p>
  		<form action="UpdateMenuServlet" method="post">
    	<div class="container">
    		<div><input class="left_label" type="text" value="菜单名称:" disabled="disabled"/>
    				<input type="text" name="menu_name" value="${menuMap.menuname }"/></div>
    		<div><input class="left_label" type="text" value="菜单等级选择:" disabled="disabled"/>	
    				<input type="text" name="menu_level" value="${menuMap.menulevel }" disabled="disabled"/>
    		</div>
    		<div><input class="left_label" type="text" value="父菜单名称:" disabled="disabled"/>  
    				<input type="text" name="father_menu_name" value="${menuMap.fathername }" disabled="disabled"/>
    		 </div>
    		<div><input class="left_label" type="text" value="菜单地址:" disabled="disabled"/>	
    				<input type="text" id="menu_value" name="menu_value" value="${menuMap.menuvalue }" <c:if test="${menuMap.fatherid==-1}">disabled="disabled"</c:if> /></div>
    				<input type="hidden" value="${menuMap.menuid }" name="menu_id"/>
    				
    		<div style="margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="确认"/>&nbsp;&nbsp;&nbsp;&nbsp;
    				<input id="cancel" type="button" value="取消" onClick="location.href='<%=basePath %>admin/menu_query_body.jsp'"/></div>
    		<div id="result" ><input class="left_label" type="text" value="${updateMenuSuc}" disabled="disabled" style="color:#FF0000;"/></div>
    	</div>
    	</form>
  </body>
  
  <script type="text/javascript">
	window.onload=function(){
		setTimeout=(showResult(),10000);
	}
	function showResult(){
		var result=document.getElementById("result");
		//result.style.display="none";
	}


	
  </script>
</html>
