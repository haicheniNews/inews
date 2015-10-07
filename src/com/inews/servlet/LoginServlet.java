package com.inews.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inews.utils.DbCRUD;

/**
 * 登录servlet
 * @author lihanchun
 *
 */
public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
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
		PrintWriter out = response.getWriter();
		String id = request.getParameter("username");
		String password = request.getParameter("password");
		String remember=request.getParameter("remember");
		System.out.println("remember:"+remember);
		DbCRUD db=new DbCRUD();
		String sql="select * from id_card where userid=? and password=?";
		
		ArrayList<Map<String,Object>>list= (ArrayList<Map<String, Object>>) db.query(sql,id,password);
		if("remember-me".equals(remember)){
			rememberMe(id,password,response);
		}
		if(list.size()>0){
			request.getSession().setAttribute("userId",id);
			//request.getRequestDispatcher("index.jsp").forward(request, response);
			
			response.sendRedirect("index.jsp");
		}else{
				response.sendRedirect("login.jsp");
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
	
	private void rememberMe(String userName,String password,HttpServletResponse response){
		Cookie user=new Cookie("user",userName+"-"+password);
		user.setMaxAge(60);
		response.addCookie(user);
	}
	

}
