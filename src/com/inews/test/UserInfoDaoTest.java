package com.inews.test;

import static org.junit.Assert.*;

import java.util.ArrayList;


import org.apache.log4j.Logger;
import org.junit.Test;

import com.inews.entity.UserInfo;
import com.inews.jdbcdao.UserInfoDao;
import com.inews.utils.DbUtils;
import com.inews.utils.Log;
import com.mysql.jdbc.log.LogFactory;



/**
 * 测试用例
 * @author chenzhijun
 *
 */
public class UserInfoDaoTest {
	static Logger log = Log.getLogInstance(UserInfoDaoTest.class);
	@Test
	public void test() {
		UserInfo userInfo = new UserInfo("u","u","u1",12,"uuu1","u","u","u1","u","u1");
		UserInfoDao udao =new UserInfoDao();
		log.info("test");
		log.error("error");
		try {
			udao.insert(userInfo);
		} catch (Exception e) {
			log.error("插入错误..");
			e.printStackTrace();
			
		}
		
		try {
			UserInfo user=udao.queryOneUser("aaa");
			log.info("查询一条用户的结果："+user.getUserName());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			ArrayList<UserInfo> list=udao.queryAllUser();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
