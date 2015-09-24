package com.inews.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inews.utils.DbCRUD;

public class RoleMenuUpdateServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RoleMenuUpdateServlet() {
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

		String roleId=request.getParameter("roleId");
		request.getSession().setAttribute("role_id", roleId);
		String menuId=request.getParameter("menuId");
		int status=Integer.parseInt(request.getParameter("status"));
		int id=Integer.parseInt(roleId);
		String[] add=request.getParameterValues("checkbox4");
		String[] delete=request.getParameterValues("checkbox2");
		
		DbCRUD dc=new DbCRUD();
		String sql;
		if(status==1){
			for(int i=0;i<add.length;i++){
				sql="insert into role_menu values(?,?)";
				dc.insert(sql, Integer.parseInt(add[i]),id);
			}
			
		}else if(status==0){
			for(int i=0;i<delete.length;i++){
				sql="delete from role_menu where menuid=? and roleid=?";
				dc.delete(sql, Integer.parseInt(delete[i]),id);
			}
		}
		
		response.sendRedirect("admin/role_update.jsp");
		
		
		
		
		
		
		
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
