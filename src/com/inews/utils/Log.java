package com.inews.utils;

import org.apache.log4j.Logger;

/**
 * 日志打印类. 调用本类的 getLogInstance()获取一个Logger
 * 
 * log.info("打印一般信息");
 * log.error("打印非常严重的错误信息");
 * 
 * 日志输出目的地为d://new_log/error.log 和 info.log
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
