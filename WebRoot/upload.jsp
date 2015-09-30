<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <base href="<%=basePath%>">
    <title>文件上传</title>
  </head>
  <body>
    <form action="UploadHandleServlet" enctype="multipart/form-data" method="post"> 
    	<div style="margin-top:150px;margin-left:100px;width:500px;height:300px" align="right">
        	上传用户：<input type="text" name="username"><br/>
        	上传图片：<input type="file" name="file1"><br/>
        	上传flash：<input type="file" name="file2"><br/>
        	<input type="submit" value="提交">
        </div>
    </form>
 <img src="images/hello.jpg">
  </body>
</html>