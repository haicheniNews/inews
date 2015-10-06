package com.inews.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.inews.utils.DbCRUD;
import com.inews.utils.PropertiesUtils;

public class IndexFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
//		HashMap<String,ArrayList<Map<String,Object>>> indexValue=new HashMap<String, ArrayList<Map<String,Object>>>();
		DbCRUD dc=new DbCRUD();
		//SELECT * FROM news a LEFT JOIN  news_type b ON a.typeid=b.typeid;
		//String sql="select * from news where typeid=? and ispublish=1 ;";/ 
		String sql="SELECT a.newsid,a.newstitle,a.typeid,b.typename FROM news a LEFT JOIN news_type b ON a.typeid=b.typeid  WHERE a.typeid=? AND a.ispublish=1 limit 0,5";
//		String[] types={"hot","military","entertainment","economy","car"};
		
		ArrayList index_my_list=new ArrayList();
		
		for(int i=0;i<5;i++){
			ArrayList<Map<String, Object>> temp=(ArrayList<Map<String, Object>>)dc.query(sql, i);
			index_my_list.add(temp);
		}
		
		ArrayList list=new ArrayList();
		String sql2 = "SELECT * FROM news GROUP BY typeid;";
		ArrayList<Map<String, Object>> temp2=(ArrayList<Map<String, Object>>)dc.query(sql2, null);
		list.add(temp2);
		
		dc.releaseConn();
		
		String value=PropertiesUtils.getFilePath();
		
		HttpServletRequest request=(HttpServletRequest) arg0;
		request.getSession().setAttribute("index_my_list", index_my_list);
		request.getSession().setAttribute("index_my_list_right", list);
		request.getSession().setAttribute("img_path", value);
		arg2.doFilter(arg0, arg1);
		System.out.println("ok"+" : "+index_my_list.size());
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
