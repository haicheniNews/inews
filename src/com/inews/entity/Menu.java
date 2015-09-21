package com.inews.entity;

/**
 * 对应数据库menu实体类-  菜单操作
 * @author chenzhijun
 *
 */
public class Menu {

	private int menuId;
	private String menuName;
	private String menuValue;
	private int menuFatherId;
	private int menuLevel;
	private String menuDesc;
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuValue() {
		return menuValue;
	}
	public void setMenuValue(String menuValue) {
		this.menuValue = menuValue;
	}
	public int getMenuFatherId() {
		return menuFatherId;
	}
	public void setMenuFatherId(int menuFatherId) {
		this.menuFatherId = menuFatherId;
	}
	public int getMenuLevel() {
		return menuLevel;
	}
	public void setMenuLevel(int menuLevel) {
		this.menuLevel = menuLevel;
	}
	public String getMenuDesc() {
		return menuDesc;
	}
	public void setMenuDesc(String menuDesc) {
		this.menuDesc = menuDesc;
	}
	
	

	
}

