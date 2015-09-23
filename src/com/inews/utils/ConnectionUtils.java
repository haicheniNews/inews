package com.inews.utils;
import java.sql.Connection;
import java.sql.DriverManager;
/**
 * 匹配原始方法的另一个数据库连接包
 * @author weipeng
 *
 */
public class ConnectionUtils {
    //当该类被加载到内中立即执行，而且只执行一次
	public static Connection getConnection()
	 throws Exception{
		String driverName="com.mysql.jdbc.Driver";
		//数据库用户名
		String userName="root";
		//密码
		String userPasswd="ABCabc123";
		//数据库名
		String dbName="db_news";
		//表名

	    //1.加载驱动程序
		String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		return DriverManager.getConnection(url);
	}
}
