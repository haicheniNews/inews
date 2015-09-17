package com.inews.filter;

import java.io.IOException;
import java.util.ArrayList;
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

import com.inews.utils.DbCRUD;

public class MenuManageFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)arg0;
		HttpServletResponse response=(HttpServletResponse)arg1;
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		DbCRUD db=new DbCRUD();
		StringBuffer sql=new StringBuffer("SELECT * FROM menu a ,(SELECT menuname fathername,menuid fatherid FROM menu) c WHERE a.menufatherid=c.fatherid ORDER BY menuid;");
		System.out.println(sql);
		List<Map<String,Object>> list=(ArrayList<Map<String, Object>>) db.query(sql.toString(),null);
		int size=list.size();
		request.getSession().setAttribute("max_record", size);
		request.getSession().setAttribute("menu_list", list);
		request.getSession().setAttribute("start",1);
		request.getSession().setAttribute("end",9);
		request.getSession().setAttribute("menu_level",-1);
		arg2.doFilter(arg0, arg1);

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
