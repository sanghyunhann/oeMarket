package oe.market.common;

import java.text.DecimalFormat;

public class NumUtil {
	public static String comma(String s) {	
		int iS = Integer.parseInt(s);
		return new DecimalFormat("###,###").format(iS);
	}
	
	public static String comma_replace(String s) {
		
		String ss = "";
		int is = s.indexOf(',');		
		
		if (is != -1) {
			System.out.println("is >>> : " + is);
			ss = s.replace(",","");
		}else {
			ss = s;
		}
		return ss;
	}
}
