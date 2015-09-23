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
 * ���û�����������dao��
 * @author weipeng
 *
 */

public class NewsDao {
	public News[] queryAll()
	 throws Exception{
//TODO Auto-generated method stub

	   	//������ConnectionUtils������������غ����ݿ�����
	   	//1.������ݿ�����
	   	Connection connection=ConnectionUtils.getConnection();
	  //2.��ȡStatement
	   	Statement statement = connection.createStatement();
	   	String sql="SELECT * FROM news";
	   	//3ִ��DQL֮����������� 
	   	//ResultSet:ִ����sql���صĽ���� ����������һ����ά��
	   	ResultSet rs=statement.executeQuery(sql);
//	   	ResultSetMetaData rmeta = rs.getMetaData();
	   	//4.������ά��(����¼ת���ɶ���)
	   	//����һ�����������洢�����еĶ���
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
	    //5.�ر���Դ
	   	rs.close();
	   	statement.close();
	   	connection.close();
 		return orders;	
	}
	
}
