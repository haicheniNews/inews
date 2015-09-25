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

public class UserManagerFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		String sql="SELECT * FROM  user_info a";
		// LEFT JOIN role_user b ON a.userid=b.userid;	
		DbCRUD dc =new DbCRUD();
		
		ArrayList<Map<String,Object>> data=(ArrayList<Map<String,Object>>)dc.query(sql, null);
		HttpServletRequest request=(HttpServletRequest)arg0;
		request.getSession().setAttribute("user_data", data);
		dc.releaseConn();
		request.getSession().setAttribute("max_record", data.size());
		request.getSession().setAttribute("start",0);
		request.getSession().setAttribute("end",10);
		arg2.doFilter(arg0, arg1);

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
