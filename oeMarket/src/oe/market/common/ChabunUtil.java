package oe.market.common;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class ChabunUtil {
	static Logger logger = LogManager.getLogger(ChabunUtil.class);
	
	
	public static final String BIZ_M 	= "M"; // 회원
	public static final String BIZ_B 	= "B"; // 게시판
	public static final String BIZ_CM	= "CM"; // 게시판 댓글
	
	public static final String BIZ_L	= "L"; // 조아용
	public static final String BIZ_C	= "C";
	
	// type : D : YYYYMMDD, M : YYYYMM, Y : YYYY, N : 
	public static String numPad(String t, String c){
	
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	 
	public static String getMemberChabun(String type, String num) {	
		logger.info("getMemberChabun >>> : " + type + " : " + num);
		
		return BIZ_M.concat(ChabunUtil.numPad(type, num));
	}
	
	public static String getBoardChabun(String type, String num) {
		logger.info("getBoardChabun >>> : " + type + " : " + num);
		
		return BIZ_B.concat(ChabunUtil.numPad(type, num));
	}
	
	public static String getOeCommChabun(String type, String num) {
		logger.info("getRboardChabun >>> : " + type + " : " + num);
		
		return BIZ_CM.concat(ChabunUtil.numPad(type, num));
	}
	
	public static String getProductChabun(String type, String memNum) {		
		return BIZ_L.concat(ChabunUtil.numPad(type, memNum));
	}	
	
	public static String getCartChabun(String type, String memNum) {
		return BIZ_C.concat(ChabunUtil.numPad(type, memNum));
	}
	
}
