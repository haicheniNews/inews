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

import com.inews.utils.DbCRUD;

public class RoleUpdateFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)arg0;
		String id=request.getParameter("roleId");
		if(id==null){
			id=(String) request.getSession().getAttribute("role_id");
		}
		String sql="SELECT * FROM menu WHERE menuid IN (SELECT menuid FROM role_menu WHERE roleid=?);";
		DbCRUD dc=new DbCRUD();
		ArrayList<Map<String,Object>> data=(ArrayList<Map<String,Object>>)dc.query(sql, Integer.parseInt(id));
		sql="SELECT * FROM menu WHERE menuid NOT IN (SELECT menuid FROM role_menu WHERE roleid=?);";
		ArrayList<Map<String,Object>> data2=(ArrayList<Map<String,Object>>)dc.query(sql, Integer.parseInt(id));
		request.getSession().setAttribute("roleUpdateData", data);
		request.getSession().setAttribute("roleUpdateData2", data2);
		request.getSession().setAttribute("role_id", id);
		dc.releaseConn();
		arg2.doFilter(arg0, arg1);

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
