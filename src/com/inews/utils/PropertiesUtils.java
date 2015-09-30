package com.inews.utils;

import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtils {
	public static String getFilePath(){
		InputStream in = DbUtils.class.getResourceAsStream("database.properties");
		Properties p = new Properties();
		String value=p.getProperty("file_path");
		return value;
		
	}

}
