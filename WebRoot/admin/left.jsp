<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<HTML>
<HEAD>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/demo.css" type="text/css">
	<style type="text/css">
		.back a{
			height: 30px;
  		width: auto;
  		padding: 0 20px;
  		background-color: red;
  		text-decoration: none;
  		line-height: 30px;
  		font-family: "微软雅黑";
  		border-radius: 3px;
  		color: #fff;
		}
		.back a:HOVER {
			background-color: yellow;
		}
	</style>
	<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
	<script type="text/javascript" src="js/jquery.ztree.exedit-3.5.js"></script>
	<SCRIPT type="text/javascript">
		<!--
		var setting = {
			data: {
				simpleData: {
					enable: true
				}
			}
			,async: {
				enable: true,
				url:"<%=basePath%>NodeSearchServlet",
				autoParam:["id", "name"],
				otherParam:{"otherParam":"zTreeAsyncTest"},
				dataFilter: filter
			}
			,callback: {
				onClick: zTreeOnClick
			}
		};
		function filter(treeId, parentNode, childNodes) {
			if (!childNodes) return null;
			for (var i=0, l=childNodes.length; i<l; i++) {
				childNodes[i].name = childNodes[i].name.replace('','');
			}
			return childNodes;
		}
		var zNodes =${sessionScope.json};

		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting,zNodes);
		});

		function zTreeOnClick(event, treeId, treeNode) {
		    console.log("ztree的ul->id"+treeId+", 选中的节点数据库id="+treeNode.id + ", 结点名=" + treeNode.name+",结点的等级"+treeNode.pId);
		   var zTree = $.fn.zTree.getZTreeObj("treeDemo");

		   $.ajax({
			   		type:"post",
			   		async:false,
			   		url:"<%=basePath%>UserRightJudgeServlet?menu_id="+treeNode.id,
			   		success:function(result){
				   		//alert("result="+result);
				   		if(result==null||result==""){
							    treeNode.url="no_right.jsp";
							    console.log("更改后url:"+treeNode.url);
							  	zTree.updateNode(treeNode);		  	
					   	}else{
							
				   				treeNode.url=result;
					   			console.log("查到的url:"+treeNode.url);
							  	zTree.updateNode(treeNode);	
					   	}
				   	}
			   });
		  	//alert("aaa"+treeNode.url);
		};
		//-->
	</SCRIPT>
 </HEAD>

<BODY>

<div class="content_wrap">
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</div>
<div class="back" style="margin-top: 200px; text-indent: 20px;"><a href="../index.jsp" target="_blank">新闻首页</a></div>
</BODY>
</HTML>