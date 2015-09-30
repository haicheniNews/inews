<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<!--      <base href="<%=basePath%>">       -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<title>page1</title>
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
		                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[用户角色管理]</td>
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
		                  
		                </table></td>
		                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
		                  
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
		            <td width="12%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">用户id</span></div></td>
		            <td width="14%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">用户名</span></div></td>
		            <td width="15%" height="22" background="images/bg.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div></td>
		          </tr>
		          
		          
		          
		          <c:forEach items="${user_data}" var="user_info" end="${end-1}">
			           <tr>
			            <td height="20" bgcolor="#FFFFFF"><div align="center">
			              <input type="checkbox" name="checkbox2" value="checkbox" />
			            </div></td>
			            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${user_info.userid}</span></div></td>
			            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${user_info.username }</span></div></td>
			            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4"><img src="images/edt.gif" width="16" height="16" /><a href="<%=basePath %>admin/user_update.jsp?user_Id=${user_info.userid  }">分配角色</a>&nbsp; &nbsp;</span></div></td>
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
		                  <td width="40"><a href="<%=basePath%>UserRoleQueryServlet?start=0&end=${end}"><img src="images/first.gif" width="37" height="15" /></a></td>
		                  <td width="45"><a href="<%=basePath%>UserRoleQueryServlet?start=${start-end}&end=${end}"><img src="images/back.gif" width="43" height="15" /></a></td>
		                  <td width="45"><a href="<%=basePath%>UserRoleQueryServlet?start=${start+end}&end=${end}"><img src="images/next.gif" width="43" height="15" /></a></td>
		                  <td width="40"><a href="<%=basePath%>userRoleQueryServlet?start=${max_record-end}&end=${end}"><img src="images/last.gif" width="37" height="15" /></a></td>
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
</html>
