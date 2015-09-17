package com.inews.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.inews.utils.DbCRUD;
import com.inews.utils.Log;
import com.inews.utils.StringUtils;

public class MenuQueryServlet extends HttpServlet {

	private Logger log=Log.getLogInstance(MenuQueryServlet.class);
	/**
	 * Constructor of the object.
	 */
	public MenuQueryServlet() {
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
//		response.setContentType("text/html;charset=utf-8");
//		request.setCharacterEncoding("GBK");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String menu_name=request.getParameter("menu_name");
		String father_id=request.getParameter("father_id");
		
		DbCRUD db=new DbCRUD();
		StringBuffer sql=new StringBuffer("select * from menu where 1=1 ");
		log.info(menu_name+" : "+father_id);
		log.info(menu_name.length()+" : "+father_id.length());
		
		if(!StringUtils.isNull(menu_name)){
			sql.append("and menuname='"+StringUtils.deleteSpace(menu_name)+"'");
		}
		if(!StringUtils.isNull(father_id)){
			sql.append(" and menufatherid="+Integer.parseInt(StringUtils.deleteSpace(father_id)));
		}
		
		log.info("菜单查询sql:"+sql.toString());
		List<Map<String,Object>> list=(ArrayList<Map<String, Object>>) db.query(sql.toString(),null);
		request.getSession().setAttribute("menu_list", list);
		response.sendRedirect("admin/menu_query_body.jsp");
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
