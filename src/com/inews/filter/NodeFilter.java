package com.inews.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;



import com.inews.utils.DbCRUD;

/**
 * 后台各菜单初始化过滤器
 */
public class NodeFilter implements Filter {

    /**
     * Default constructor. 
     */
    public NodeFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("come  into  filter...");
		
		DbCRUD db=new DbCRUD();
		String sql="SELECT  * FROM menu WHERE menulevel=?";
		List<Map<String,Object>> list=(List<Map<String, Object>>) db.query(sql, 0);
		List<Map<String,Object>> newList=new ArrayList<Map<String, Object>>();
		
		for(Map<String,Object> map:list){
			Object id=map.get("menuid");
			Object menuName=map.get("menuname");
			Object menuValue=map.get("menuvalue");//��Ӧurl
			Object menuLevel= map.get("menulevel");
			HashMap<String,Object> temp=new HashMap<String,Object>();
			temp.put("id", id);
			temp.put("pId", menuLevel);
			temp.put("name", menuName);
			temp.put("isParent", "true");
			newList.add(temp);
		}
		
		
		JSONArray arr = new JSONArray(newList);
		JSONObject json = new JSONObject();

		try {
			json.put("success", true);
			json.put("arr", arr);
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		HttpServletRequest req=(HttpServletRequest)request;
		req.setCharacterEncoding("utf-8");
		req.getSession().setAttribute("json", arr.toString());
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
