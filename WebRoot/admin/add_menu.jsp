<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>菜单管理</title>
    
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

  </head>
  
  <body>
  		<p>菜单管理:</p>
    	<div class="container">
    		<div><input class="left_label" type="text" value="菜单名称:"/>		<input type="text" name="menu_name" /></div>
    		<div><input class="left_label" type="text" value="菜单等级选择:"/>	<select name="level_id"><option>0</option><option>1</option><option>2</option></select>	</div>
    		<div><input class="left_label" type="text" value="父菜单名称:"/>   <select name="father_level_id"><option>系统管理</option><option>新闻系统管理</option></select></div>
    		<div><input class="left_label" type="text" value="菜单地址:"/>		<input type="text" name="menu_value" /></div>
    		<div><input style="float:right;" type="submit" value="确认"/><input style="float:right;" type="button" value="取消"/></div>
    		<div></div>
    	</div>
    
  </body>
</html>
