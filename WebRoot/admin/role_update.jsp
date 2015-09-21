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
    
    <title>角色更新</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<style type="text/css">
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

	</style>
	<script type="text/javascript" src="<%=basePath%>js/ajax.js"></script>

  </head>
  
  <body>
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
		                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[未分配权限]</td>
		              </tr>
		            </table></td>
		            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
		              <tr>
		                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
		                  <tr>
		                  </tr>
		                </table></td>
		                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
		                  <tr>
		                    <td class="STYLE1"><div align="center"><img src="images/22.gif" width="14" height="14" /></div></td>
		                    <td class="STYLE1"><div align="center"><a href="<%=basePath %>admin/add_menu.jsp">添加</a></div></td>
		                  </tr>
		                </table></td>
		                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
		                  <tr>
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
		         <!--    <td width="3%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">菜单编号</span></div></td> -->
		            <td width="12%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">菜单名</span></div></td>
		            <td width="14%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">菜单值</span></div></td>
		            <td width="18%" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">菜单等级</span></div></td>
		            <td width="23%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">父菜单名称</span></div></td>
		          </tr>
		          
		          
		          
		          <c:forEach items="${menu_list}" var="menu_map">
			           <tr>
			            <td height="20" bgcolor="#FFFFFF"><div align="center">
			              <input type="checkbox" name="checkbox2" value="checkbox" />
			            </div></td>
			            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${menu_map.menuname }</span></div></td>
			            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${menu_map.menuvalue } </span></div></td>
			            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${menu_map.menulevel }</span></div></td>
			            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${menu_map.fathername }</span></div></td>
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
		            </table></td>
		          </tr>
		        </table></td>
		        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
		      </tr>
		    </table></td>	
		  </tr>
		</table>
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
		                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[已有权限]</td>
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
		                    <td class="STYLE1"><div align="center"><img src="images/11.gif" width="14" height="14" /></div></td>
		                    <td class="STYLE1"><div align="center">删除</div></td>
		                  </tr>
		                </table></td>
		                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
		                  <tr>
		                   
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
		         <!--    <td width="3%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">菜单编号</span></div></td> -->
		            <td width="12%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">菜单名</span></div></td>
		            <td width="14%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">菜单值</span></div></td>
		            <td width="18%" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">菜单等级</span></div></td>
		            <td width="23%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">父菜单名称</span></div></td>
		          </tr>
		          
		          
		          
		          <c:forEach items="${menu_list}" var="menu_map">
			           <tr>
			            <td height="20" bgcolor="#FFFFFF"><div align="center">
			              <input type="checkbox" name="checkbox2" value="checkbox" />
			            </div></td>
			            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${menu_map.menuname }</span></div></td>
			            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${menu_map.menuvalue } </span></div></td>
			            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${menu_map.menulevel }</span></div></td>
			            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${menu_map.fathername }</span></div></td>
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
	window.onload=function(){
		setTimeout=(showResult(),10000);
	}
	function showResult(){
		var result=document.getElementById("result");
		//result.style.display="none";
	}


	
  </script>
</html>
