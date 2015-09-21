package com.inews.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inews.utils.DbCRUD;

/**
 * 更新菜单的值:主要是菜单名,和菜单值
 * @author chenzhijun
 *
 */
public class UpdateMenuServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateMenuServlet() {
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

		String id=request.getParameter("menu_id");
		String menuName=request.getParameter("menu_name");
		String menuValue=request.getParameter("menu_value");
		String menuDesc=request.getParameter("menu_desc");
		
		StringBuffer sql=new StringBuffer("UPDATE menu SET  ");
		if(menuName!=null){
			sql.append(" menuname='"+menuName+"'");
		}
		if(menuValue!=null){
			sql.append(" ,menuvalue='"+menuValue+"'");
		}
		if(menuValue!=null){
			sql.append(" ,menudesc='"+menuDesc+"' ");
		}
		sql.append(" WHERE menuid="+Integer.parseInt(id)+";");
		DbCRUD dc=new DbCRUD();
		int result=(Integer)dc.update(sql.toString(), null);
		
		if(result==1){
			request.getSession().setAttribute("updateMenuSuc", "更新成功");
			response.sendRedirect("admin/update_menu.jsp?menuId="+Integer.parseInt(id));
			//request.getRequestDispatcher("admin/update_menu.jsp").forward(request, response);
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
