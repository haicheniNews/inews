package com.inews.jdbcdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

import com.inews.entity.News;
import com.inews.utils.ConnectionUtils;

/**
 * 利用基本方法构造dao类
 * @author weipeng
 *
 */

public class NewsDao {
	public News[] queryAll()
	 throws Exception{
//TODO Auto-generated method stub

	   	//利用了ConnectionUtils完成了驱动加载和数据库连接
	   	//1.完成数据库连接
	   	Connection connection=ConnectionUtils.getConnection();
	  //2.获取Statement
	   	Statement statement = connection.createStatement();
	   	String sql="SELECT * FROM news";
	   	//3执行DQL之后会产生结果集 
	   	//ResultSet:执行完sql返回的结果集 这个结果集是一个二维表
	   	ResultSet rs=statement.executeQuery(sql);
//	   	ResultSetMetaData rmeta = rs.getMetaData();
	   	//4.遍历二维表(将记录转换成对象)
	   	//创建一个数组用来存储数据中的对象
	   	News[] orders=new News[0];
	   	while(rs.next()){
	   		News order=new News();
	   		order.setNewsId(rs.getInt(1));
	   		order.setNewsTitle(rs.getString(2));
	   		order.setNewsBody(rs.getString(3));
	   		order.setNewsDate(rs.getString(4));
	   		order.setNewsAuthor(rs.getString(5));
	   		order.setNewsImage(rs.getString(6));
	   		order.setNewsVideo(rs.getString(7));
	   		order.setTypeId(rs.getInt(8));
	   		order.setIsPublish(rs.getInt(9));
	   		orders=Arrays.copyOf(orders, orders.length+1);
	   		orders[orders.length-1]=order;   	
	   	}
	    //5.关闭资源
	   	rs.close();
	   	statement.close();
	   	connection.close();
 		return orders;	
	}
	
}
