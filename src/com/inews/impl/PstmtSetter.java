package com.inews.impl;

import java.sql.PreparedStatement;

/**
 * 将PreparedStatement的参数设置进去
 * @author chenzhijun
 *
 */
public interface PstmtSetter {
	public PreparedStatement setForPstmt(PreparedStatement ps) throws Exception;
}
