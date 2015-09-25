package com.inews.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.inews.utils.DbCRUD;

public class URLFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session=req.getSession();
		String userId=(String) session.getAttribute("userId");
		String url=req.getRequestURI();
		DbCRUD dc = new DbCRUD();
		String[] urls=url.split("/");
		
		String sql="SELECT menuvalue FROM menu WHERE menuid IN (SELECT menuid FROM role_menu WHERE roleid IN (SELECT roleid FROM role_user WHERE userid=?)) AND menuvalue=?;";
		ArrayList<Map<String,Object>> data =(ArrayList<Map<String,Object>>)dc.query(sql,userId,urls[urls.length-1]);
		System.out.println("url:"+url+" data.size():"+data.size());//获取项目的/iNews/index.jsp
		
/*		if(urls[urls.length-1].contains("left.jsp")||urls[urls.length-1].contains("index.html")){
			chain.doFilter(request, response);
		}*/
		
//		if(data.size()<=0&&!urls[urls.length-1].contains("no_right")){
//			((HttpServletResponse)response).sendRedirect("../no_right.jsp");
//		}else{
//			chain.doFilter(request, response);
//		}
		chain.doFilter(request, response);
		
		
		
		
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
