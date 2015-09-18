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
	
	<script type="text/javascript" src="<%=basePath%>js/ajax.js"></script>

  </head>
  
  <body>
  		<p>菜单管理:</p>
    	<div class="container">
    		<div><input class="left_label" type="text" value="菜单名称:" disabled="disabled"/>		<input type="text" name="menu_name" /></div>
    		<div><input class="left_label" type="text" value="菜单等级选择:" disabled="disabled"/>	
    			<select id="menu_level" name="level_id" onchange="get_father_menu_level()">
    				<option value="0">0</option>
    				<option value="1">1</option>
    				<option value="2">2</option>
    			</select>
    		</div>
    		<div><input class="left_label" type="text" value="父菜单名称:" disabled="disabled"/>  
    			<select name="father_menu_level" id="father_menu_level">
    			</select>
    		 </div>
    		<div><input class="left_label" type="text" value="菜单地址:" disabled="disabled"/>		<input type="text" name="menu_value" /></div>
    		<div style="margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="确认"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取消"/></div>
    		<div></div>
    	</div>
    
  </body>
  
  <script type="text/javascript">
  	var xhr=createXHR();
	var s1=document.getElementById("menu_level");
	var s2=document.getElementById("father_menu_level");
	function get_father_menu_level(){
		
		var index = s1.selectedIndex;
		var text = s1.options[index].text;
		var value = s1.options[index].value;
		alert("text:"+text+"  value:"+value);
		s2.options.length=0;
		if(index==0){
			return;
		}
	  	xhr.open("POST","AddMenuServlet",true);
		xhr.setRequestHeader("content-type","application/x-www-form-urlencoded; charset=UTF-8");
		xhr.onreadystatechange=update;
		xhr.send("father_level="+(value-1));
		/*
		for(var i=0;i<10;i++){
		s2.add(new Option("text"+i,i));
		s2.options.length=0;
		}
		*/
	}

	function update(){
		if(xhr.readyState == 4){  
			if(xhr.status == 200){
				var result=xhr.responseText;
				var data=JSON.parse(result);
				//alert("data[0].menulevel:"+data[0].menulevel+" menuname:"+data[0].menuname);
				//alert("data:"+data);
				for(var i=0;i<data.length;i++){
					s2.add(new Option(data[i].menuname,data[i].menuid));
				}
				
			} else if (xhr.status==404){
		         alert("Not found");
			} else{
		         alert("Error: status code is " + request.status);
			}
		}
	}
	
  </script>
</html>
