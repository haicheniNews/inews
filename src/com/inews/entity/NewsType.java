package com.inews.entity;

/**
 * 对应数据库news_type 实体类--新闻类型
 * @author chenzhijun
 *
 */
public class NewsType {

	private int typeId;
	private String typeName;
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	

}

