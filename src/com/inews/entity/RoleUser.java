package com.inews.entity;

/**
 * 对应数据库role_user实体类--角色用户关联
 * @author chenzhijun
 *
 */
public class RoleUser {

	private int roleId;
	private String userId;
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	

}

