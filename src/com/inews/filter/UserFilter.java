package com.inews.filter;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.inews.utils.DbCRUD;
import com.inews.utils.Log;

/**
 * 用户权限过滤
 * 判断是否能访问后台admin/文件夹
 * @author chenzhijun
 *
 */
public class UserFilter implements Filter {
	private Logger log=Log.getLogInstance(UserFilter.class);
	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		/*
		 * 要访问的话admin下的话.必须先判断一下是否为admin用户.
		 * 所有的用户都有一个普通用户的角色,数据库中id为7
		 * 判断一下如果是后台管理员的话后台数据库返回的总记录值不为1就可以了
		 */
		
		HttpServletRequest req=(HttpServletRequest)request;
		String userId=(String) req.getSession().getAttribute("userId");
		DbCRUD dbCrud=new DbCRUD();
		String sql="select * from role_user where userid=?";
		List<Map<String,Object>> list=(List<Map<String, Object>>) dbCrud.query(sql, userId);
		if(list.size()<=1){
			//普通用户
			((HttpServletResponse)response).sendRedirect("../index.jsp");
			//request.getRequestDispatcher("../index.jsp").forward(request, response);
		}else{
			//后台管理用户
			//System.out.println("后台管理用户放行.");
			log.info("后台管理员用户..");
		}
		chain.doFilter(request, response);
		

	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}

}
