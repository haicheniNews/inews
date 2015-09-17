package com.inews.utils;

public class StringUtils {
	
	/**
	 * 去掉字符串中的空格
	 * @param str
	 * @return
	 */
	public static String deleteSpace(String str){
		String newStr=str.replaceAll(" ", "");
		return newStr;
	}
	
	/**
	 * 为空时返回true;
	 * 不为空时返回false;
	 * @param str
	 * @return
	 */
	public static boolean isNull(String str){
		if(str==null||str.length()<=0){
			return true;
		}
		return false;
	}

}
