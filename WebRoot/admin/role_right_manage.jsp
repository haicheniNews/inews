<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.inews.utils.StringUtils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>菜单查询显示</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>

<script>
var  highlightcolor='#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
</script>

</head>


<%
/*
		int start;
	int end;
	String s=request.getParameter("start");
	String e=request.getParameter("end");
	if(StringUtils.isNull(s)){
		s="0";
	}
	start=Integer.parseInt(s);
	
	if(StringUtils.isNull(e)){
		e="5";	
		end=Integer.parseInt(e);
	}else{
		end=5;
	}
	System.out.println(start+":"+end);
	request.setAttribute("start",start);
	request.setAttribute("end",end);
*/
%>

<body>
	<div class="up" style="margin:50px 0px 50px 0px;">
	</div>
	
	<div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
		        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
		          <tr>
		            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
		              <tr>
		                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
		                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[菜单查询与管理]</td>
		              </tr>
		            </table></td>
		            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
		              <tr>
		                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
		                  <tr>
		                    <!--<td class="STYLE1"><div align="center">
		                      <input type="checkbox" name="checkbox62" value="checkbox" />
		                    </div></td>
		                      <td class="STYLE1"><div align="center">全选</div></td>-->
		                  </tr>
		                </table></td>
		                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
		                  <tr>
		                    <td class="STYLE1"><div align="center"><img src="images/22.gif" width="14" height="14" /></div></td>
		                    <td class="STYLE1"><div align="center"><a href="<%=basePath %>admin/add_menu.jsp">新增</a></div></td>
		                  </tr>
		                </table></td>
		                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
		                  <tr>
		                    <td class="STYLE1"><div align="center"><img src="images/11.gif" width="14" height="14" /></div></td>
		                    <td class="STYLE1"><div align="center">删除</div></td>
		                  </tr>
		                </table></td>
		              </tr>
		            </table></td>
		          </tr>
		        </table></td>
		        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
		      </tr>
		    </table></td>
		  </tr>
		  <tr>
		    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td width="8" background="images/tab_12.gif">&nbsp;</td>
		        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
		          <tr>
		            <td width="3%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center">
		              <input type="checkbox" name="checkbox" value="checkbox" />
		            </div></td>
		            <td width="12%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">角色id</span></div></td>
		            <td width="14%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">角色名</span></div></td>
		            <td width="15%" height="22" background="images/bg.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div></td>
		          </tr>
		          
		          
		          
		          <c:forEach items="${roleList}" var="role_map" end="${end-1}">
			           <tr>
			            <td height="20" bgcolor="#FFFFFF"><div align="center">
			              <input type="checkbox" name="checkbox2" value="checkbox" />
			            </div></td>
			            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${role_map.roleid}</span></div></td>
			            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${role_map.rolename }</span></div></td>
			            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4"><img src="images/edt.gif" width="16" height="16" /><a href="<%=basePath %>admin/update_menu.jsp?menuId=${role_map.roleid  }">编辑</a>&nbsp; &nbsp;<img src="images/del.gif" width="16" height="16" /><a href="<%=basePath %>DeleteMenuById?menu_id=${role_map.menuid  }" onclick="return deleteRecord(${menu_map.menulevel  })" id="delete">删除</a></span></div></td>
			          </tr>
		          </c:forEach>
		
		
		        </table></td>
		        <td width="8" background="images/tab_15.gif">&nbsp;</td>
		      </tr>
		    </table></td>
		  </tr>
		  <tr>
		    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
		        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
		          <tr>
		            <td class="STYLE4">&nbsp;&nbsp; &nbsp;&nbsp;</td>
		            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
		                <tr>
		                  <td width="40"><a href="<%=basePath%>RoleQueryServlet?start=0&end=${end}"><img src="images/first.gif" width="37" height="15" /></a></td>
		                  <td width="45"><a href="<%=basePath%>RoleQueryServlet?start=${start-end}&end=${end}"><img src="images/back.gif" width="43" height="15" /></a></td>
		                  <td width="45"><a href="<%=basePath%>RoleQueryServlet?start=${start+end}&end=${end}"><img src="images/next.gif" width="43" height="15" /></a></td>
		                  <td width="40"><a href="<%=basePath%>RoleQueryServlet?start=${max_record-end}&end=${end}"><img src="images/last.gif" width="37" height="15" /></a></td>
		                  <td width="100"><div align="center"><span class="STYLE1">转到第
		                    <input name="textfield" id="jump" onkeyup="changePath()" type="text" size="4" style="height:16px; width:20px; border:1px solid #999999;" value="${sessionScope.textFiled }"/> 
		                    页 </span></div></td>
		                  <td width="40"><a id="jumpto" href="<%=basePath%>RoleQueryServlet?end=${end}&start="><img src="images/go.gif" width="37" height="15" /></a></td>
		                </tr>
		            </table></td>
		          </tr>
		        </table></td>
		        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
		      </tr>
		    </table></td>
		  </tr>
		</table>
	</div>
</body>

<script type="text/javascript">
	function changePath(){
		var da=document.getElementById("jumpto");
		var value=document.getElementById("jump").value;
		var backup=value;
		
			value=(value-1)*10;
	
		da.href=da.href+""+value+"&textfield="+backup;
		
		//alert(da.href);
	}

	function deleteRecord(level_id){
		//alert(level_id);
		if(confirm("确认删除?")){
			return true;
		}else{
			return false;
		}
	}
	
	
</script>

</html>
