package com.inews.impl;

import java.sql.PreparedStatement;

/**
 * ��PreparedStatement�Ĳ������ý�ȥ
 * @author chenzhijun
 *
 */
public interface PstmtSetter {
	public PreparedStatement setForPstmt(PreparedStatement ps) throws Exception;
}
