package com.inews.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inews.utils.DbCRUD;
import com.inews.utils.StringUtils;

public class UserRoleQueryServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserRoleQueryServlet() {
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

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String textfield=request.getParameter("textfield");
		System.out.println(textfield);
		int start;
		int end;
		String s=request.getParameter("start");
		if(StringUtils.isNull(s)){
			s="0";
		}
		start=Integer.parseInt(s);
		end=10;
		
		if(start<0||end<0){
			response.sendRedirect("admin/user_manage.jsp");
			return;
		}
		
		DbCRUD db=new DbCRUD();
		StringBuffer sql=new StringBuffer("SELECT * FROM  user_info a LEFT JOIN role_user b ON a.userid=b.userid limit ?,?;");
		
		List<Map<String,Object>> list=(ArrayList<Map<String, Object>>) db.query(sql.toString(),start,end);
		
		request.getSession().setAttribute("roleList", list);
		request.getSession().setAttribute("start",start);
		request.getSession().setAttribute("end",end);
		request.getSession().setAttribute("textFiled", textfield);
		request.getRequestDispatcher("admin/user_manage.jsp").forward(request, response);
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
