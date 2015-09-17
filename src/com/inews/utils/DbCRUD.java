package com.inews.utils;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.inews.impl.CRUD;

/**
 * ʹ��sql + [ֵ] ����ʽ���������ݿ�
 * String sql="select * from test where t1=?";
 * String t1=20;
 * this.query(sql,20)
 * @author chenzhijun
 *
 */
public class DbCRUD implements CRUD {
	static Logger log=Log.getLogInstance(DbCRUD.class);

	private Connection conn = DbUtils.getConnection();

	
	public Object insert(String sql, Object... args) {
		return action(sql,args);
	}



	public Object delete(String sql, Object... args) {
		return action(sql,args);
	}

	public Object update(String sql, Object... args) {
		return action(sql,args);
	}

	public Object query(String sql, Object... args) {
		PreparedStatement pstmt=null;
		ArrayList<Map<String, Object>> data=new ArrayList<Map<String, Object>>(0);
		try {
			pstmt = pstmtInit(conn.prepareStatement(sql),args);
			
			ResultSet rs = pstmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int length = rsmd.getColumnCount();
			while(rs.next()){
				Map<String, Object> map=new LinkedHashMap<String, Object>();
				for(int i=1;i<=length;i++){
					String name=rsmd.getColumnName(i);//��ȡ����
					Object o=rs.getObject(name);
					map.put(name,o);
				}
				data.add(map);
			}
			DbUtils.releaseResource(null, pstmt, rs);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		return data;
	}
	
	/**
	 * ��pstmt���.�����sql������?�Ļ��Ͳ���,û�о�ֱ�ӷ���pstmt
	 * @param pstmt
	 * @param args
	 * @return ��ʽ���õ�pstmt
	 */
	private PreparedStatement pstmtInit(PreparedStatement pstmt, Object[] args) {
		if(args==null){
			return pstmt;
		}
		int i=0;
		for(Object o:args){
			try {
				pstmt.setObject(++i, o);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		log.info(pstmt.toString());
		return pstmt;
	}
	
	/**
	 * ִ��insert��update���;
	 * @param pstmt
	 * @return Ӱ�����
	 */
	private int action(String sql, Object[] args) {
		PreparedStatement pstmt=null;
		int result=-1;
		try {
			pstmt = pstmtInit(conn.prepareStatement(sql),args);
			result=pstmt.executeUpdate();
			
			DbUtils.releaseResource(null, pstmt, null);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public void releaseConn(){
		DbUtils.releaseResource(conn, null, null);
	}
	


}
