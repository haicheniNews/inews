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

import com.inews.utils.DbCRUD;

public class RoleRightInitFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		DbCRUD dc=new DbCRUD();
		String sql="select * from role";
		List<Map<String,Object>> list = (ArrayList<Map<String,Object>>)dc.query(sql, null);
		dc.releaseConn();
		HttpServletRequest request=(HttpServletRequest)arg0;
		request.getSession().setAttribute("roleList", list);
		request.getSession().setAttribute("max_record", list.size());
		request.getSession().setAttribute("menu_list", list);
		request.getSession().setAttribute("start",0);
		request.getSession().setAttribute("end",10);
		arg2.doFilter(arg0, arg1);

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
