package com.inews.impl;

/**
 * 根据sql语句和值来实现数据库操作. 只提供接口,不提供实现.
 * @author chenzhijun
 *
 */
public interface CRUD {

	/**
	 * 插入一条记录的接口
	 * @param sql 执行的sql语句
	 * @param args sql的参数
	 * @return
	 */
	public Object insert(String sql,Object ...args);
	
	/**
	 * 删除一条记录
	 * @param sql
	 * @param args
	 * @return
	 */
	public Object delete(String sql,Object ...args);
	
	/**
	 * 更新数据
	 * @param sql
	 * @param args
	 * @return
	 */
	public Object update(String sql,Object ...args);
	
	/**
	 * 查找数据
	 * @param sql
	 * @param args
	 * @return
	 */
	public Object query(String sql,Object ...args);
}
