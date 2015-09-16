package com.inews.entity;

/**
 * 对应数据库role_menu实体类--角色菜单关联
 * @author chenzhijun
 *
 */
public class RoleMenu {

	private int menuId;
	private int roleId;
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	

}

