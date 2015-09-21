package com.inews.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inews.utils.DbCRUD;
import com.inews.utils.StringUtils;

/**
 * 菜单新增页面
 * @author chenzhijun
 *
 */
public class AddMenuServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddMenuServlet() {
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
		String menuName=request.getParameter("menu_name");
//System.out.println("menuName1:="+menuName);
		String fatherMenuLevel=request.getParameter("father_menu_level");
		String menuLevel=request.getParameter("menu_level");
		String menuValue=request.getParameter("menu_value");
		String menuDesc=request.getParameter("menu_desc");
		
//System.out.println("menuName:"+new String(menuName.getBytes(),"utf-8"));
		
		String sql="INSERT INTO menu VALUES(NULL,?,?,?,?,?);";
		DbCRUD dc=new DbCRUD();
		
		if(StringUtils.isNull(menuDesc)||StringUtils.isNull(menuLevel)||StringUtils.isNull(menuValue)||StringUtils.isNull(menuName)){
			request.getSession().setAttribute("adminError", "系统错误");
			response.sendRedirect("error.jsp");
		}
		int result=0;
		if(null==fatherMenuLevel){
			fatherMenuLevel="-1";
			sql="INSERT INTO menu VALUES(NULL,?,NULL,?,?,?);";
			result=(Integer)dc.insert(sql, menuName,Integer.parseInt(fatherMenuLevel),Integer.parseInt(menuLevel),menuDesc);
		}else{
			result=(Integer)dc.insert(sql, menuName,menuValue,Integer.parseInt(fatherMenuLevel),Integer.parseInt(menuLevel),menuDesc);
			
		}
		dc.releaseConn();
		if(result==1){
			request.getSession().setAttribute("addMenuSuc", "增加成功");
			response.sendRedirect("admin/add_menu.jsp");
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
