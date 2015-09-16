package com.inews.entity;

/**
 * 对应数据库id_card实体类 -- 用户名和密码存储
 * @author chenzhijun
 *
 */
public class IdCard {

	private String userId;
	private String password;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public IdCard(String userId, String password) {
		super();
		this.userId = userId;
		this.password = password;
	}
	public IdCard() {
		super();
	}
	
	

	

}

