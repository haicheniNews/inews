package com.inews.test;

import org.junit.Test;


public class NormalTest {
	
	@Test
	public void stringTest(){
		String a = " ni hao a";
		String newa=a.replaceAll(" ","");
		String[] arr=a.split(" ");
		StringBuffer sb=new StringBuffer();
		for(String s:arr){
			if(!s.equals(" ")){
				sb.append(s);
			}
		}
		
		System.out.println(sb.toString());
		System.out.println(newa);
	}

}
