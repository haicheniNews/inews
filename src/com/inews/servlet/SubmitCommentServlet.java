package com.inews.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inews.utils.DbCRUD;

public class SubmitCommentServlet extends HttpServlet {

/**
 * 在某一新闻详情页  中递交 评论数据 到数据库，并且同时展示到原界面
 * @author weipeng
 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		System.out.println("aaaa");
		//String username = request.getParameter("username");

		String content = request.getParameter("content1");
		String newsid = request.getParameter("newsid");
		String newsauthor = request.getParameter("newsauthor");
		
		Date dt = new Date();//获取当前时间
		SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日HH时mm分");
		String date =format.format(dt);
		//插入comment数据到数据库
		DbCRUD db = new DbCRUD();
		String sql="insert into comment(newsid,commentdate,commentbody,userid,commentip) values(?,?,?,?,?)";	
		int result=(Integer) db.update(sql,newsid,date,content,newsauthor,"");
		result++;
		db.releaseConn();       
		
		//跳转界面
		request.setAttribute("nid",newsid);
		request.getRequestDispatcher("/news_browse.jsp").forward(request, response);
	


        
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
