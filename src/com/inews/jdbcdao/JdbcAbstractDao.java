package com.inews.jdbcdao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.inews.impl.PackageEntity;
import com.inews.impl.PstmtSetter;
import com.inews.utils.DbUtils;

/**
 * 
 * @author 
 *
 */
public class JdbcAbstractDao {
	/**
	 * 
	 * @param sql
	 * @param pstmtSetter
	 * @param packageEntity
	 * @return object
	 * @throws Exception
	 */
	public final Object queryForObject(String sql,PstmtSetter pstmtSetter,PackageEntity packageEntity)throws Exception{
		Connection conn = DbUtils.getConnection();//��ȡ���ݿ�����
		if(conn == null){
			throw new RuntimeException("�������ݿ�ʧ��!");
		}
		if(sql == null){
			throw new RuntimeException("sql���Ϊ��");
		}
		PreparedStatement ps = null;
		ps = conn.prepareStatement(sql);
		//�������SQL���Ĳ���
		if(pstmtSetter != null){
			pstmtSetter.setForPstmt(ps);
		}
		//�õ������
		ResultSet rs = ps.executeQuery();
		Object object = null;
		//�Խ�������з�װ
		if(packageEntity!=null){
			object = packageEntity.packageEntity(rs);
		}
		if(rs != null) {
			rs.close();
		}
		if(ps != null){
			ps.close();
		}
		if(conn != null){
			conn.close();
		}//�ر�����
		return object;
	}
	/**
	 * 
	 * @param sql
	 * @param pstmtSetter
	 * @param packageEntity
	 * @return Ӱ�����
	 * @throws Exception
	 */
	public final int doUpdate(String sql,PstmtSetter pstmtSetter)throws Exception{
		int result = -1;
		Connection conn = DbUtils.getConnection();//��ȡ����
		if(conn == null){
			throw new RuntimeException("û�л�ȡ������");
		}
		if(sql == null){
			throw new RuntimeException("sql���Ϊ��");
		}
		PreparedStatement ps = null;
		ps = conn.prepareStatement(sql);
		if(pstmtSetter != null){//������ز���
			pstmtSetter.setForPstmt(ps);
		}//����
		result = ps.executeUpdate();
		if(ps != null){
			ps.close();
		}
		if(conn != null){
			conn.close();
		}
		return result;
	}
}
