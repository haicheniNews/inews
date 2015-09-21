package com.inews.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import com.inews.utils.DbCRUD;


public class SubmitServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//response.setContentType("text/html;charset=gbk");
		//request.setCharacterEncoding("GBK");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();	

        //以下代码为新闻信息加入数据库内容代码
		System.out.println("aaaa");
		//String username = request.getParameter("username");

		String content = request.getParameter("content1");
		String title = request.getParameter("title");
		String name = request.getParameter("checkbox");         //取出选中类别的数值
		String userid = request.getParameter("userid");

		System.out.println("name=:"+name);

        //将数据加入数据库！
		content.replaceAll("\n","<br>");
		content.replaceAll(" ","&nbsp;");

		System.out.println(content);
		int[] varity = new int[1] ; //新闻类别	
		if(name.equals("热点")){
			varity[0] = 0; 
		}
		if(name.equals("军事")){
			varity[0] = 1; 
		}
		if(name.equals("娱乐")){
			varity[0] = 2; 
		}
		if(name.equals("经济")){
			varity[0] = 3; 
		}
		if(name.equals("汽车")){
			varity[0] = 4; 
		}
		System.out.println("类别id："+varity[0]);	
		
		Date dt = new Date();//获取当前时间
		SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日HH时mm分");
		String date =format.format(dt);
		
		DbCRUD db = new DbCRUD();
		String sql="insert into news(newstitle,newsbody,newsdate,userid,newsimage,newsvideo,typeid,ispublish) values(?,?,?,?,?,?,?,?)";	
		int result=(Integer) db.update(sql,title,content,date,userid,"6","7",varity[0],"0");
		result++;
		db.releaseConn();       
		
		//跳转界面

		response.sendRedirect("/iNews/SubmitTempServlet");
		
	}
	
	

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
