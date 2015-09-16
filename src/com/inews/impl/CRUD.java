package com.inews.impl;

/**
 * ����sql����ֵ��ʵ�����ݿ����. ֻ�ṩ�ӿ�,���ṩʵ��.
 * @author chenzhijun
 *
 */
public interface CRUD {

	/**
	 * ����һ����¼�Ľӿ�
	 * @param sql ִ�е�sql���
	 * @param args sql�Ĳ���
	 * @return
	 */
	public Object insert(String sql,Object ...args);
	
	/**
	 * ɾ��һ����¼
	 * @param sql
	 * @param args
	 * @return
	 */
	public Object delete(String sql,Object ...args);
	
	/**
	 * ��������
	 * @param sql
	 * @param args
	 * @return
	 */
	public Object update(String sql,Object ...args);
	
	/**
	 * ��������
	 * @param sql
	 * @param args
	 * @return
	 */
	public Object query(String sql,Object ...args);
}
