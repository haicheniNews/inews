<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.inews.utils.DbCRUD"%>
<%@page import="com.inews.entity.*"%>
<%@page import="com.inews.jdbcdao.NewsDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
		NewsDao newsdao = new NewsDao();
		News[] news =new News[newsdao.queryAll().length];
		int i;
			
		try {		

			news = newsdao.queryAll();
			//request.getSession().setAttribute("news",news);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
			//实现查询用户级别 产生不同权限
		String userid = (String)request.getSession().getAttribute("userId");
			//让不同级别用户对应不同界面显示	0-   1    2    3
		int[] user ={2,1,0,0,0,0,-1};
		//得到roleid
				System.out.println(userid);
		DbCRUD db = new DbCRUD();
		int roleid[] = new int[1];
		int j;
		String query = "SELECT * FROM role_user where userid=?;";
		ArrayList<Map<String, Object>> data = (ArrayList<Map<String, Object>>) db.query(query, userid);
		RoleUser rs[] = new RoleUser[100];
		int count = 0;
		for (Map<String, Object> map : data) {
			roleid[0] = (Integer)map.get("roleid");

		}	
		int tempint = roleid[0];
		
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-ch">
<head>
	<title>主页</title>
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
<link rel="stylesheet" type="text/css" href="./static/css/index.css">
<body>
	<div class="header">
		<div class="img1">&nbsp; 
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
	<div class="nav">
		<div class="title fl">
			<ul>
				<li><a href="index.jsp">首页</a></li>
				<li><a href="#">热点</a></li>
				<li><a href="#">军事</a></li>
				<li><a href="#">娱乐</a></li>
				<li><a href="#">经济</a></li>
				<li><a href="#">汽车</a></li>
			</ul>
		</div>	

			<div class="search fr">
				<form action="url"><input type="text">&nbsp;<input type="submit" value="搜索">&nbsp;</form>
			</div>
		
	</div>
	
	<!--      表格栏            -->
	<div id="tab">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
	        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td  valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	              <tr>
	                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
	                <td width="95%" class="STYLE1"><span >新闻审核状态</span></td>
	              </tr>
	            </table></td>
	            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">

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

	            <td width="3%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">序号</span></div></td>
	            <td width="23%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">新闻标题</span></div></td>
	            <td width="12%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">创建者</span></div></td>
	            <td width="22%" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">创建时间</span></div></td>
	            <td width="10%" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">类别</span></div></td>
	            <td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">审核状态</span></div></td>
	            <td width="20%" height="22" background="images/bg.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div></td>
	          </tr>
	          
	          <% for(i = 0; i < news.length; i++){
	          		
	          %>
	          <tr>
	            <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
	              <div align="center"><%=i+1%></div>
	            </div></td>
	            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=news[i].getNewsTitle()%></span></div></td>
	            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=news[i].getNewsAuthor() %></span></div></td>
	            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=news[i].getNewsDate()%></span></div></td>
	            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">
	            <%
					  if(news[i].getTypeId() == 0){
	            			out.print("热点"); 
	            	  } else if(news[i].getTypeId() == 1){
	            	  		out.print("军事");
	            	  }else if(news[i].getTypeId() == 2){
	            	  	    out.print("娱乐");
	            	  }else if(news[i].getTypeId() == 3){
	            	  		out.print("经济");
	            	  }else {
	            	  		out.print("汽车");
	            	  }    
	            	  System.out.println(news[i].getIsPublish());	            
	            %>
	            </span></div></td>
	            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">
	            <%    if(tempint == 0){
	            			out.print("待审核"); 
	            	  } else if(tempint == 1){
	            	  		out.print("初审");
	            	  }else if(tempint == 2){
	            	  		out.print("复审");
	            	  }else if(tempint == 3){
	            	  		out.print("审核不过");
	            	  }else {
	            	  		out.print("null");
	            	  }    

	            	  %>
				</span></div></td>
	            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4"><img src="images/edt.gif" width="16" height="16" />&nbsp; &nbsp;<img src="images/del.gif" width="16" height="16" />审核操作</span></div></td>
	          </tr>
			<%}  %>
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
	            <td class="STYLE4">&nbsp;&nbsp;共有 <%= i %> 条记录</td>
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
	
	
	
	<div class="footer" >
				 <div id="site_nav">
				    <ul>
				      <li><a href="/index/service">广告服务</a></li>
				      <li><a href="/index/contactus">联系我们</a></li>
				      <li ><a href="/index/friend_links">友情链接:</a></li>
				      <li ><a href="#">百度</a></li>
				  	  <li ><a href="#">搜狐</a></li>
					  <li ><a href="#">谷歌</a></li>
					  <li class="last" ><a href="#">新浪</a></li>
				    </ul>
				  </div>
				 
				  <div id="copyright">
				    &copy; 2003-2015 ITeye.com.    [ <a href="http://www.miibeian.gov.cn">京ICP证110151号</a>  京公网安备110105010620 ]<br/>
				    iNews(北京)投资有限公司  版权所有<br />
				  </div>
	</div>


</body>

</html>