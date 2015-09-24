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

public class UserUpdateFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)arg0;
		String id=request.getParameter("user_Id");
		if(id==null){
			id=(String) request.getSession().getAttribute("user_Id");
		}
		String sql="SELECT * FROM role WHERE roleid IN (SELECT roleid FROM role_user WHERE userid=?);";
		DbCRUD dc=new DbCRUD();
		ArrayList<Map<String,Object>> data=(ArrayList<Map<String,Object>>)dc.query(sql, id);
		sql="SELECT * FROM role WHERE roleid NOT IN (SELECT roleid FROM role_user WHERE userid=?);";
		ArrayList<Map<String,Object>> data2=(ArrayList<Map<String,Object>>)dc.query(sql, id);
		request.getSession().setAttribute("userUpdateData", data);
		request.getSession().setAttribute("userUpdateData2", data2);
		request.getSession().setAttribute("user_Id", id);
		dc.releaseConn();
		arg2.doFilter(arg0, arg1);

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
