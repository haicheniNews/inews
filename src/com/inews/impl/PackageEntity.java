package com.inews.impl;

import java.sql.ResultSet;
import java.util.List;
/**
 * 将对象打包.
 * @author chenzhijun
 *
 */
public interface PackageEntity {
	public List<Object> packageEntity(ResultSet rs) throws Exception;
}
