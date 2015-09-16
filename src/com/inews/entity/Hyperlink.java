package com.inews.entity;

/**
 * 对应数据库实体 类Hyperlink-超链接
 * @author chenzhijun
 *
 */
public class Hyperlink {

	private int linkId;
	private String linkName;
	private String linkAddress;
	public int getLinkId() {
		return linkId;
	}
	public void setLinkId(int linkId) {
		this.linkId = linkId;
	}
	public String getLinkName() {
		return linkName;
	}
	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}
	public String getLinkAddress() {
		return linkAddress;
	}
	public void setLinkAddress(String linkAddress) {
		this.linkAddress = linkAddress;
	}

	
}

