package com.inews.impl;

import java.sql.ResultSet;
import java.util.List;
/**
 * ��������.
 * @author chenzhijun
 *
 */
public interface PackageEntity {
	public List<Object> packageEntity(ResultSet rs) throws Exception;
}
