package com.inews.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inews.utils.DbCRUD;
/**
 * 用户注册servlet,提供用户注册的功能
 * @author chenzhijun
 *
 */
public class UserRegisterServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserRegisterServlet() {
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
			response.setCharacterEncoding("utf-8");
			PrintWriter out=response.getWriter();
			String userId=request.getParameter("userId");
			String userSearch=request.getParameter("userSearch");
			DbCRUD db=new DbCRUD();
			String isRegister=request.getParameter("isRegister");
			if(userSearch!=null&&userSearch.equals("1")){
				String sql="select * from id_card where userid=?";
				ArrayList<Map<String, Object>> result=(ArrayList<Map<String, Object>>) db.query(sql, userId);
				
				if(result.size()<=0){
					out.write("1");
				}else{
					out.write("0");
				}
				out.close();
				return;
			}
			if(isRegister.equals("1")&&isRegister!=null){
				String password=request.getParameter("pwd");
				String email=request.getParameter("email");
				String sql="insert into id_card(userid,password) values(?,?)";
				int result=(Integer) db.update(sql, userId,password);
				sql="insert into user_info set userid=?,useremail=?";
				db.update(sql, userId,email);
				result++;
				db.releaseConn();
				System.out.println("ok");
				request.getSession().setAttribute("userId", userId);
//				request.getRequestDispatcher("index.jsp").forward(request, response);
				response.sendRedirect("index.jsp");
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
