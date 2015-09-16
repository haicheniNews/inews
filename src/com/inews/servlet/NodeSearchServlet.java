package com.inews.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.inews.utils.DbCRUD;

/**
 * 点击节点的时候初始化子节点的值
 * @author chenzhijun
 *
 */
public class NodeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NodeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String otherParam = request.getParameter("otherParam");
		System.out.println(id + "|" + name + "|" + otherParam);
		
		DbCRUD db=new DbCRUD();
		String sql="SELECT * FROM menu WHERE menufatherid=?;";
		List<Map<String,Object>> list=(List<Map<String, Object>>) db.query(sql, Integer.parseInt(id));
		List<Map<String,Object>> newList=new ArrayList<Map<String, Object>>();
		
		for(Map<String,Object> map:list){
			Object mid=map.get("menuid");
			Object menuName=map.get("menuname");
			Object menuValue=map.get("menuvalue");//获取url
			Object menuLevel= map.get("menulevel");
			HashMap<String,Object> temp=new HashMap<String,Object>();
			if(menuValue==null){
				temp.put("isParent", "true");
			}
			else{
				temp.put("url", menuValue);
				temp.put("target", "frame2");
			}
			temp.put("id", mid);
			temp.put("pId", menuLevel);
			temp.put("name", menuName);
			newList.add(temp);
		}
		JSONObject json=new JSONObject();
		JSONArray arr = new JSONArray(newList);

		try {
			json.put("success", true);
			json.put("arr", arr);
		} catch (JSONException e) {
			e.printStackTrace();
		}
//		System.out.println("--------json------" + json.toString());
//		System.out.println("--------jsonArray------" + arr.toString());

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		response.getWriter().write(arr.toString());
	}

}
