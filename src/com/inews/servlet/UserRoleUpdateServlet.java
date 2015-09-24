package com.inews.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inews.utils.DbCRUD;

public class UserRoleUpdateServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserRoleUpdateServlet() {
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

		String userId=request.getParameter("user_Id");
		request.getSession().setAttribute("user_Id", userId);
		int status=Integer.parseInt(request.getParameter("status"));
		String[] add=request.getParameterValues("checkbox4");
		String[] delete=request.getParameterValues("checkbox2");
		
		DbCRUD dc=new DbCRUD();
		String sql;
		if(status==1){
			for(int i=0;i<add.length;i++){
				sql="insert into role_user values(?,?)";
				dc.insert(sql, Integer.parseInt(add[i]),userId);
			}
			
		}else if(status==0){
			for(int i=0;i<delete.length;i++){
				if(Integer.parseInt(delete[i])==7){
					break;
				}
				sql="delete from role_user where roleid=? and userid=?";
				dc.delete(sql, Integer.parseInt(delete[i]),userId);
			}
		}
		
		response.sendRedirect("admin/user_update.jsp");
		
		
		
		
		
		
		
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
