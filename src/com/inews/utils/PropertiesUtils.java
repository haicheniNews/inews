package com.inews.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtils {
	public static String getFilePath(){
		InputStream in = DbUtils.class.getResourceAsStream("database.properties");
		Properties p = new Properties();
		try {
			p.load(in);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String value=p.getProperty("file_path");
		return value;
		
	}

}
