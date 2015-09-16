package com.inews.utils;

import org.apache.log4j.Logger;

/**
 * ��־��ӡ��. ���ñ���� getLogInstance()��ȡһ��Logger
 * 
 * log.info("��ӡһ����Ϣ");
 * log.error("��ӡ�ǳ����صĴ�����Ϣ");
 * 
 * ��־���Ŀ�ĵ�Ϊd://new_log/error.log �� info.log
 * 
 * @author chenzhijun
 *
 */
public class Log {
	private static Class clazz;
	private static class MyLog{
		private static final Logger instance = Logger.getLogger(clazz);
	}
	
	private Log(){}
	
	public static Logger getLogInstance(Class c){
		clazz=c;
		return MyLog.instance;
	}

}
