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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String menu_name=request.getParameter("menu_name");
		String menu_level=request.getParameter("menu_level");
		String textfield=request.getParameter("textfield");
		System.out.println(textfield);
		int start;
		int end;
		String s=request.getParameter("start");
		String e=request.getParameter("end");
		if(StringUtils.isNull(s)){
			s="1";
		}
		start=Integer.parseInt(s);
		
		if(StringUtils.isNull(e)){
			e="10";	
			end=Integer.parseInt(e);
		}else{
			end=10;
		}
		
		if(start<0||end<0){
			response.sendRedirect("admin/menu_query_body.jsp");
			return;
		}
		
		DbCRUD db=new DbCRUD();
		StringBuffer sql=new StringBuffer("select * from menu where 1=1 ");
		
		if(StringUtils.isNull(menu_level)){
			menu_level=(Integer)request.getSession().getAttribute("menu_level")+"";
		}
		if(!StringUtils.isNull(menu_name)){
			sql.append("and menuname like '%"+StringUtils.deleteSpace(menu_name)+"%'");
		}
		if(!StringUtils.isNull(menu_level)&&!menu_level.equals("-1")){
			sql.append(" and menulevel = '"+Integer.parseInt(StringUtils.deleteSpace(menu_level))+"'");
		}
		
		sql.append(" limit ?,?");
		
		log.info("菜单查询sql:"+sql.toString());
		List<Map<String,Object>> list=(ArrayList<Map<String, Object>>) db.query(sql.toString(),start,end);
		
		request.getSession().setAttribute("menu_list", list);
		request.getSession().setAttribute("start",start);
		request.getSession().setAttribute("end",end);
		request.getSession().setAttribute("menu_level", Integer.parseInt(menu_level));
		request.getSession().setAttribute("textFiled", textfield);
		request.getRequestDispatcher("admin/menu_query_body.jsp").forward(request, response);
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
