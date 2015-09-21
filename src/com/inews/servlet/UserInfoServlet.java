package com.inews.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inews.utils.DbCRUD;
import com.inews.utils.DbUtils;

public class UserInfoServlet extends HttpServlet {

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
		
		response.setContentType("text/html;charset=gbk");
		request.setCharacterEncoding("GBK");
		PrintWriter out=response.getWriter();	
		
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");         //取出选中类别的数值
		String address = request.getParameter("address");
		String country = request.getParameter("country");
		String id = (String)request.getSession().getAttribute("userId");
		System.out.println("iddddddddddddddddddddd:"+id);		
		System.out.println("country         :"+country);
		
		DbCRUD db = new DbCRUD();
		String update = "UPDATE user_info SET username=?,useraddress=?,userphone=?,usercountry=? WHERE userid=?;";
		db.update(update,name,address,phone,country, id);
		db.releaseConn(); 
        request.getRequestDispatcher("/userinfo.jsp").forward(request, response);
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

		doGet(request, response);
	}

}
