package oe.market.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class O_Session {
	private static final String O_SESSION_ID = "OID";
	
	private static class LazyHolder{
		public static final O_Session SESSIONLISTENER_INSTANCE = new O_Session();
	}	
	
	public static O_Session getInstance(){
		return LazyHolder.SESSIONLISTENER_INSTANCE;
	}

	public O_Session(){
		
	}
	
	public void killSession(final HttpServletRequest hReq){
			
		HttpSession hSession = hReq.getSession(false);			
		if (hSession !=null) {
			hSession.removeAttribute(O_SESSION_ID);
			hSession.invalidate();
		}
	}
	
	public boolean setSession(final HttpServletRequest hReq, final String userID) {
		
		HttpSession hSession = hReq.getSession();
		String o_session_val = (String)hSession.getAttribute(O_SESSION_ID);
		int nCnt = 0;
		
		if (o_session_val !=null) {
			boolean b1 = o_session_val.equals(userID);
			
			if (b1) { 
				nCnt++; 
			}else {
				System.out.println("세션 없음 >>> : ");
			}
		}else {
			System.out.println("세션 없음 >>> : ");
		}
		
		if (nCnt == 0) {
//			hSession.invalidate();
			hSession.setAttribute(O_SESSION_ID, userID);
			hSession.setMaxInactiveInterval(60*60*9); // 9시간 
			
			return false;
		}		
		return true;
	}
	
	public String getSession(final HttpServletRequest hReq){
		
		String strSession = "";		
		HttpSession hSession = hReq.getSession(false);		
		if (hSession !=null) {
			strSession = (String)hSession.getAttribute(O_SESSION_ID);
		}							
		return strSession;
	}	
	public void invalidateSession(HttpServletRequest req) {
	    HttpSession session = req.getSession(false);
	    if (session != null) {
	        session.invalidate();
	    }
	}
}
