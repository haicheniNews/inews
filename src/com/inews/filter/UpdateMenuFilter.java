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

public class UpdateMenuFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		int menuId=Integer.parseInt(request.getParameter("menuId"));
		DbCRUD dc=new DbCRUD();
		String sql="SELECT * FROM menu a ,(SELECT menuname fathername,menuid fatherid FROM menu) c WHERE a.menufatherid=c.fatherid AND a.menuid=? ORDER BY menuid;";
		List<Map<String,Object>> list=(ArrayList<Map<String,Object>>)dc.query(sql, menuId);
		Map<String,Object> menuMap=list.get(0);
		
		request.getSession().setAttribute("menuMap", menuMap);
		arg2.doFilter(arg0, arg1);

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
