package com.inews.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inews.utils.StringUtils;

public class IndexToQuantityServlet extends HttpServlet {

/**
 * 从首页到具体类别的展示界面，例如点击热点，进入 热点 新闻展示界面
 * @author weipeng
 */
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		
		System.out.println(name);
		int id;
		if(name.equals("hot")){
			id = 0;
		}else if(name.equals("military")){
			id = 1;			
		}else if(name.equals("amusement")){
			id = 2;		
		}else if(name.equals("economic")){
			id = 3;			
		}else{
			id = 4;				
		}    
		System.out.println(id);
		request.setAttribute("id", id);
		
		request.getRequestDispatcher("/news_quantity.jsp").forward(request, response);	
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
