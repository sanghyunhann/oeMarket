package oe.market.common;

public class CodeUtil {
	public static final String[] gender_value = {"여자","남자"};
	
	public static final String hp_value = "010";
	
	// 생일
	public static String birth(String s) {

		String s0 = "";
		String s1 = "";
		String s2 = "";
		String ss = "";
		
		if (s !=null && s.length() > 0){			
			int sLen = s.length();			
			if (8 == sLen) {
				s0 = s.substring(0, 4);
				s1 = s.substring(4, 6);
				s2 = s.substring(6);				
				ss = s0 + "-" + s1 + "-" + s2;
			}
		}		
		return ss;
	}
	
	// 성별
	public static String gender(String s) {
		return "F".equals(s.toUpperCase()) ? "여자" : "남자";
	}
	
	// 핸드폰
	public static String hp(String s) {

		String s0 = "";
		String s1 = "";
		String s2 = "";
		String ss = "";
		
		if (s !=null && s.length() > 0){			
			int sLen = s.length();			
			if (11 == sLen) {
				s0 = s.substring(0, 3);
				s1 = s.substring(3, 7);
				s2 = s.substring(7);
				ss = s0 + s1 + s2;
			}
		}		
		return ss;
	}
}
