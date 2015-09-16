package com.inews.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

/**
 * 数据加载操作.可以通用
 * 
 * @author chenzhijun
 *
 */
public class DbUtils {
	/**
	 * 读取数据库配置文件
	 * @return
	 */
	private static Map<String,String> readProperties(){
		InputStream in = DbUtils.class.getResourceAsStream("database.properties");
		Properties p = new Properties();
		Map<String,String> map = new HashMap<String,String>();
		try {
			p.load(in);
			Set set = p.entrySet();
			Iterator it = set.iterator();
			while(it.hasNext()){
				Map.Entry entry = (Map.Entry)it.next();
				String key = (String) entry.getKey();
				map.put(key, p.getProperty(key));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(map.isEmpty()){
			return null;
		}
		return map;
		
		
	}
	
	/**
	 * 获取Connection
	 * @return
	 */
	public static Connection getConnection(){
		Map<String , String> map = readProperties();
		if(map.isEmpty()){
			return null;
		}
		Connection conn= null;
		try {
			Class.forName(map.get("driver_name"));
			String url = map.get("connection")+map.get("company")+map.get("ip_port")+map.get("db_name");
			conn = DriverManager.getConnection(url,map.get("user"),map.get("password"));

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(conn!=null){
			return conn;
		}else{
			return null;
		}
		
	}
	
	/**
	 * 释放connetion,PreparedStatement, Resultset资源
	 * @param connection
	 * @param pstmt
	 * @param rs
	 */
	public static void releaseResource(Connection connection,PreparedStatement pstmt,ResultSet rs){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(connection!=null){
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
