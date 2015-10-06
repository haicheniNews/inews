package com.inews.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inews.utils.StringUtils;

public class IndexToBrowseServlet extends HttpServlet {

	/**
	 * 从主页到某一新闻详情页  处理信息跳转
	 * @author weipeng
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String name = (String)request.getParameter("name");
		request.setAttribute("nid", name);
		String p=request.getParameter("pre");
		int pre=0;
		if(!StringUtils.isNull(p)){
			pre=Integer.parseInt(p);
		}
		if(pre==1){
			request.setAttribute("pre", pre);
		}
		request.getRequestDispatcher("/news_browse.jsp").forward(request, response);
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

		this.doGet(request, response);
	}

}
