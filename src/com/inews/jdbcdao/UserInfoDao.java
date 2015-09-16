package com.inews.jdbcdao;

import java.util.ArrayList;

import com.inews.entity.UserInfo;

/**
 * ≤‚ ‘¿‡
 * @author chenzhijun
 *
 */
public class UserInfoDao extends JdbcBaseDao{

	public int insert(UserInfo userInfo) throws Exception{
		String sql="insert into user_info(userid,username,usersex,userage,useraddress) values (?,?,?,?,?)";
		int result =update(sql, UserInfo.class, userInfo.getUserId(),userInfo.getUserName(),userInfo.getUserSex(),userInfo.getUserAge(),userInfo.getUserAddress());
		return result;
		
	}
	
	
	public UserInfo queryOneUser(String value) throws Exception{
		String sql="select * from user_info where userid = ?";
		ArrayList<UserInfo> list = (ArrayList<UserInfo>)queryToList(sql, UserInfo.class, value);
		return (UserInfo)list.get(0);
	}
	
	public ArrayList<UserInfo> queryAllUser() throws Exception{
		String sql="select * from user_info";
		ArrayList<UserInfo> list = (ArrayList<UserInfo>)queryToList(sql, UserInfo.class,null);
		return list;
	}
	
	

}
