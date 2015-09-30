package com.inews.test;

import java.util.ArrayList;
import java.util.Map;

import org.junit.Test;

import com.inews.entity.RoleUser;
import com.inews.utils.DbCRUD;
import com.inews.utils.PropertiesUtils;


public class DemoTest {

	@Test
  public void roleTest(){
		String userid="admin";
		DbCRUD db = new DbCRUD();
		int j = 0;
		String query = "SELECT * FROM role_user where userid=?;";
		ArrayList<Map<String, Object>> data = (ArrayList<Map<String, Object>>) db.query(query, userid);
		RoleUser rs[] = new RoleUser[100];
		int [] user= new int[2];
		int count = 0;
		for (Map<String, Object> map : data) {
			user[0]=(Integer)map.get("roleid");

		}	
		
		System.out.println("user[0]="+user[0]);
  }
	@Test
	public void proTest(){
		String value=PropertiesUtils.getFilePath();
		System.out.println(value);
	}
	
	
}
