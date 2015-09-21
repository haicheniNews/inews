<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page  import="com.inews.utils.*" %>
<%@ page  import="com.inews.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%
		String userid = (String)request.getSession().getAttribute("userId");
		DbCRUD db = new DbCRUD();
		String query = "SELECT * FROM user_info where userid=?;";
		ArrayList<Map<String, Object>> data = (ArrayList<Map<String, Object>>) db.query(query, userid);
		UserInfo info = new UserInfo();
		int count = 0;
		for (Map<String, Object> map : data) {
			Set<String> set = map.keySet();
			Iterator<String> it = set.iterator();
			while (it.hasNext()) {
				String name = (String) it.next();
				if(name.equals("username")){
					info.setUserName((String)map.get(name));
					//System.out.println(map.get(name));
				}
				if(name.equals("userphone")){
					info.setUserPhone((String)map.get(name));
					//System.out.println(map.get(name));
				}
				if(name.equals("useraddress")){
					info.setUserAddress((String)map.get(name));
					//System.out.println(map.get(name));
				}
				if(name.equals("usercountry")){
					info.setUserCountry((String)map.get(name));
					//System.out.println(map.get(name));
				}

				count++;
			}

		}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
      		<div style="margin-top: 10px;text-align: center;margin-bottom:20px;"><font size="20px">用户信息表</font></div>
      		<div style="width:140px;height: 250px;float: left;margin-left: 400px;">	 	
    		<label style="float:left;width:140px;height:35px;text-align: right;margin-top: 10px;">用户id：</label>
			<label style="float:left;width:140px;height:35px;margin-top: 19px;text-align: right;">姓名：</label>
			<label style="float:left;width:140px;height:35px;margin-top: 19px;text-align: right;">手机号码：</label>
			<label style="float:left;width:140px;height:35px;margin-top: 19px;text-align: right;">联系地址：</label>
			<label style="float:left;width:140px;height:35px;margin-top: 19px;text-align: right;">国籍：</label>
  		  	</div>
  		  	
  			<div style="width:600px;height: 250px;float: left;margin-left: 20px;">
  			<form name="formUser"  action="/iNews/UserInfoServlet" method="post"">
	  			<input type="text" value="<%=userid %>"  name="userid" style="float:left;width:240px;height:35px;" disabled="disabled"><span id="username_notice" style="float:right; width:350px;height:35px;margin-top: 5px;"></span>
	  			<input type="text" value="<%=info.getUserName() %>"  name="name" style="float:left;width:240px;height:35px;margin-top: 19px;"><span id=password_notice  style="float:right; width:350px;height:35px;margin-top: 19px;"></span> 
	  			<input type="text" value="<%=info.getUserPhone() %>"  name="phone" style="float:left;width:240px;height:35px;margin-top: 19px;"> <span  id=conform_password_notice style="float:right; width:350px;height:35px;margin-top: 19px;"></span>  
	  			<input type="text" value="<%=info.getUserAddress() %>"  name="address" style="float:left;width:240px;height:35px;margin-top: 19px;"><span  id=conform_password_notice style="float:right; width:350px;height:35px;margin-top: 19px;"></span>
	  	  		<input type="text" value="<%=info.getUserCountry() %>"  name="country" style="float:left;width:240px;height:35px;margin-top: 19px;"><span  id=conform_password_notice style="float:right; width:350px;height:35px;margin-top: 19px;"></span>
	  		    <input type="submit" style="width:234px;height:32px;margin-left: 3px;margin-top: 30px;background-color: #019858;border:0px;color: white;cursor:pointer;font-size: 20px;" value="更新" name="Submit1" class="anniu"> 
  			</form>
  			</div> 	
  </body>
</html>
