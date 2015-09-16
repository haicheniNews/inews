package com.inews.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inews.utils.DbCRUD;
/**
 * 用户权限判断,当用户点击某一个菜单时,判断用户是否能访问到菜单url
 * @author chenzhijun
 *
 */
public class UserRightJudgeServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserRightJudgeServlet() {
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
	 * 判断点击菜单是是否可以点击进去
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		String menu_id = request.getParameter("menu_id");
		String userId = (String) request.getSession().getAttribute("userId");
	
		DbCRUD dbCrud=new DbCRUD();
		String sql="SELECT menuvalue FROM menu a,role_menu b,role_user c WHERE a.menuid=b.menuid AND a.menuid=? AND b.roleid=c.roleid AND c.userid=?;";
		List<Map<String,Object>> list=(List<Map<String, Object>>) dbCrud.query(sql,menu_id,userId);
	//	System.out.println(menu_id+" : "+userId+"    ...........ok");
	//  System.out.println("list.size():"+list.size());
		if(list.size()<=0){
			out.write("0");
		}else{
			out.write("1");
		}
		out.close();
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
