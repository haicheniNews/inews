package com.inews.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inews.utils.DbCRUD;
import com.inews.utils.StringUtils;

public class PassNewsById extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public PassNewsById() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

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

		this.doPost(request, response);
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

		String isPub=request.getParameter("isPub");
		String newsId=request.getParameter("newsId");
		String check=request.getParameter("check");
		
		String update="UPDATE news SET ispublish=? WHERE newsid=?";
		DbCRUD dc=new DbCRUD();
		int i=(Integer)dc.update(update, Integer.parseInt(isPub),Integer.parseInt(newsId));
		dc.releaseConn();
		
		if(i>0&&StringUtils.isNull(check)){
			response.sendRedirect("admin/news_manage.jsp?news_type="+request.getSession().getAttribute("type_id"));
		}else if(i>0&&!StringUtils.isNull(check)){
			response.sendRedirect("admin/news_recheck.jsp?news_type="+request.getSession().getAttribute("type_id"));
		}else{
			System.out.println("审核出错了. PassNewsById");
			response.sendRedirect("admin/error.jsp");
		}
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
