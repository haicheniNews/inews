package com.inews.utils;

public class StringUtils {
	
	/**
	 * ȥ���ַ����еĿո�
	 * @param str
	 * @return
	 */
	public static String deleteSpace(String str){
		String newStr=str.replaceAll(" ", "");
		return newStr;
	}
	
	/**
	 * Ϊ��ʱ����true;
	 * ��Ϊ��ʱ����false;
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
