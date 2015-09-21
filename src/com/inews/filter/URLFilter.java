package com.inews.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		
		//String sql="SELECT * FROM menu a,role_menu b,role_user c WHERE a.menuid=b.menuid AND a.menuvalue=? AND b.roleid=c.roleid AND c.userid=?";
		//dc.query(sql,url,userid);
		System.out.println("url:"+url);//获取项目的/iNews/index.jsp
		String[] urls=url.split("/");
		/*System.out.println(urls.length);
		for(int i=0;i<urls.length;i++){
			System.out.println(urls[i]);
		}*/
		System.out.println(urls[urls.length-1]);
		chain.doFilter(request, response);
		
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
