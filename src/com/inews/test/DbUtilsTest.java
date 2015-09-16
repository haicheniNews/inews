package com.inews.test;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import junit.framework.Assert;

import org.apache.log4j.Logger;
import org.junit.Test;

import com.inews.utils.DbCRUD;
import com.inews.utils.DbUtils;
import com.inews.utils.Log;

public class DbUtilsTest {

	DbCRUD dc = new DbCRUD();
	static Logger log = Log.getLogInstance(DbUtilsTest.class);

	@Test
	public void dbUtilsTest() {
		Connection conn = DbUtils.getConnection();
		Assert.assertNotNull(conn);
		log.info("连接测试完成..");
	}

	@Test
	public void insertTest() {
		String insert = "INSERT INTO user_info (userid,username,usersex,userage,useraddress) VALUES (?,?,?,?,?);";
		dc.insert(insert, "fff1", "fff", "man", 12, "fff");
		
	}

	@Test
	public void updateTest() {
		String update = "UPDATE user_info SET usersex=? WHERE userid=?;";
		dc.update(update, "man1", "fff");
	}

	@Test
	public void deleteTest() {
		String delete = "DELETE FROM user_info WHERE userid=?;";
		dc.delete(delete, "fff");
	}

	/**
	 * 单表查询
	 */
	@Test
	public void queryTest() {
		String query = "SELECT * FROM id_card where userid=?;";
		ArrayList<Map<String, Object>> data = (ArrayList<Map<String, Object>>) dc.query(query, "aaa");

		int count = 0;
		for (Map<String, Object> map : data) {
			Set<String> set = map.keySet();
			Iterator<String> it = set.iterator();
			while (it.hasNext()) {
				String name = (String) it.next();
				System.out.print(name + " : " + map.get(name) + " ;");
				count++;
			}
			System.out.println();
		}
		System.out.println("count:" + count);

		System.out
				.println("========================分割线:另外一种遍历方式======================");

		count = 0;
		int length = data.size();
		for (int i = 0; i < length; i++) {
			Map<String, Object> map = data.get(i);
			System.out.println("我的userid:"+map.get("userid"));
			Set<String> keys = map.keySet();
			Iterator<String> it = keys.iterator();
			while (it.hasNext()) {
				String key = it.next();
				System.out.print(key + " : " + map.get(key) + " ;");
				count++;
			}
			System.out.println();
			System.out.println(count);

		}
		System.out.println("count:" + count);

	}

	@Test
	public void queryUnionTest() {
		String query = "SELECT * FROM id_card a LEFT JOIN user_info b ON a.userid=b.userid ;";
		ArrayList<Map<String, Object>> data = (ArrayList<Map<String, Object>>) dc
				.query(query, null);

		int count = 0;
		for (Map<String, Object> map : data) {
			Set<String> set = map.keySet();
			Iterator<String> it = set.iterator();
			while (it.hasNext()) {
				String name = (String) it.next();
				System.out.print(name + " : " + map.get(name) + " ;");
				count++;
			}
			System.out.println();
		}
		System.out.println("count:" + count);
	}
	
	@Test
	public void mapTest(){
		ArrayList<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = new IdentityHashMap<String,Object>();
		Object b=getObj();
		map.put("userid", b);
		list.add(map);
		Map<String,Object> data = list.get(0);
		System.out.println(data.get("userid"));

		System.out.println("userid:"+ data.get("userid"));
		
	}

	private Object getObj() {
		Object a=new Object();
		return a;
	}

}

















