package com.inews.jdbcdao;


import java.lang.reflect.Method;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

import com.inews.impl.PackageEntity;
import com.inews.impl.PstmtSetter;

public class JdbcBaseDao extends JdbcAbstractDao{
	/**
	 * 
	 * @param sql �ṹ����ѯ���
	 * @param clazz ĳʵ�����Ӧ�ķ���
	 * @param args SQL������Ӧ�Ĳ���
	 * @return object ���ص����ݷ�װ��object����
	 * @throws Exception
	 */
	public Object queryToList(String sql,final Class<?> clazz,final Object ...args)throws Exception{
		Object object = null;
		//��ȡ����
		object = queryForObject(sql, new PstmtSetter(){
			public PreparedStatement setForPstmt(PreparedStatement ps) throws Exception {
				// ���ò���
				if(args != null && args.length>0){
					for(int i = 0 ; i < args.length ; i++){
							ps.setObject(i+1, args[i]);
					}
				}
				return ps;
			}
			
		}, new PackageEntity(){

			public List<Object> packageEntity(ResultSet rs) throws Exception {
				// TODO Auto-generated method stub
				List<Object> list = null;
				if(rs!=null){
					list = new ArrayList<Object>();
					//��ȡ���󷽷�
					Method[] methods = clazz.getMethods();
					//��ȡ�������Ԫ����
					ResultSetMetaData metaData = rs.getMetaData();
					//�������������	
					while(rs.next()){
						//ʵ�����ö���
							Object object = clazz.newInstance();
							for(int i = 0 ; i < metaData.getColumnCount(); i++){
								//��ȡ����
								String columnName = metaData.getColumnName(i+1);
								//��ȡ��Ӧ������ֵ
								Object columnValue = rs.getObject(columnName);
								//�����������󷽷����ҵ���columnName���Ӧ�ķ���������������Ӧ��set����
								for(Method method :methods){
									
									if(method.getName().equalsIgnoreCase("set"+columnName)){
										method.invoke(object, columnValue);
										break;
									}
								}
								
							}//�Ѷ������list��
							list.add(object);
						}
				}
				return list;
			}
			
		});
		return object;
	}
	/***
	 * 
	 * @param sql �ṹ����ѯ��䣬�������£����룬ɾ��
	 * @param clazz ĳʵ�����Ӧ�ķ���
	 * @param args ����ռλ����ֵ
	 * @return int Ӱ�������
	 * @throws Exception
	 */
	public int update(String sql,Class<?> clazz,final Object ...args)throws Exception{
		int result = -1;
		result = doUpdate(sql, new PstmtSetter(){
			
			public PreparedStatement setForPstmt(PreparedStatement ps)throws Exception{
				if(args!=null && args.length>0){
					for(int i = 0 ; i < args.length; i++){
						ps.setObject(i+1, args[i]);
					}
				}
				return ps;
			}
		});
		return result ;
	}
}

