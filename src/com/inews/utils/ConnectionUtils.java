package com.inews.utils;
import java.sql.Connection;
import java.sql.DriverManager;
/**
 * ƥ��ԭʼ��������һ�����ݿ����Ӱ�
 * @author weipeng
 *
 */
public class ConnectionUtils {
    //�����౻���ص���������ִ�У�����ִֻ��һ��
	public static Connection getConnection()
	 throws Exception{
		String driverName="com.mysql.jdbc.Driver";
		//���ݿ��û���
		String userName="root";
		//����
		String userPasswd="ABCabc123";
		//���ݿ���
		String dbName="db_news";
		//����

	    //1.������������
		String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		return DriverManager.getConnection(url);
	}
}
