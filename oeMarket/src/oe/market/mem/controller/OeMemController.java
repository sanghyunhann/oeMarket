package oe.market.mem.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import oe.market.common.ChabunUtil;
import oe.market.common.FileUploadUtil;
import oe.market.common.O_Session;
import oe.market.common.chabun.service.OeChabunService;
import oe.market.mem.service.OeMemService;
import oe.market.mem.vo.OeMemVO;

@Controller
public class OeMemController {
	Logger logger = LogManager.getLogger(OeMemController.class);
	
	// 필드 오토 와이어드
		@Autowired(required=false)
		private OeChabunService oeChabunService;

		// 필드 오토 와이어드
		@Autowired(required=false)
		private OeMemService oeMemService;
		
		@GetMapping("memForm")
		public String oeMemInsertForm() {
			return "mem/memForm";
		}
		
		@PostMapping("memInsert")
		public String oeMemInsert(HttpServletRequest req) {
			logger.info("Controller insert 함수 진입");

			// 채번 구하기 
			String onum = ChabunUtil.getMemberChabun("D", oeChabunService.getOeMemberChabun().getOnum());
			logger.info("onum >>> : " + onum);
			
			OeMemVO ovo = null;
			ovo = new OeMemVO();
			
			logger.info(req.getParameter("oname"));
			// 채번 
			ovo.setOnum(onum);
			
			// 이름 
			ovo.setOname(req.getParameter("oname"));
			
			// 아이디
			ovo.setOid(req.getParameter("oid"));
			
			// 패스워드
			ovo.setOpw(req.getParameter("opw"));		
			
			// 성별
			ovo.setOgender(req.getParameter("ogender"));
			
			
			// 핸드폰 번호 
			String ohp = req.getParameter("ohp");
			String ohp1 = req.getParameter("ohp1");
			String ohp2 = req.getParameter("ohp2");
			ovo.setOhp(ohp+ohp1+ohp2);
			
			// 이메일 
			String oemail = req.getParameter("oemail");
			String oemail1 = req.getParameter("oemail1");		
			ovo.setOemail(oemail+"@"+oemail1);				
			
			// 도로명 주소, 지번 주소
			ovo.setOzonecode(req.getParameter("ozonecode"));
			ovo.setOroad(req.getParameter("oroad"));
			ovo.setOroaddetail(req.getParameter("oroaddetail"));
			ovo.setOjibun(req.getParameter("ojibun"));
					
			// 서비스 호출
			int nCnt = oeMemService.oeMemInsert(ovo);
			
			if (nCnt > 0) {
				logger.info("Insert 함수 nCnt >>> : " + nCnt);
				return "mem/memInsert";
			}
			
			return "mem/memForm";
		}
		
		@PostMapping("memSelect")
		public String oeMemSelect(OeMemVO ovo, Model model) {
		
			logger.info("MemberSelect 함수 진입 >>> : ");
			
			List<OeMemVO> listS = oeMemService.oeMemSelect(ovo);
			logger.info("MemberSelect 함수 진입 ovo >>> : " + ovo.getOid());
			logger.info("MemberSelect 함수 진입 ovo >>> : " + ovo.getOnum());
			if (listS.size() > 0) {
				logger.info("kosMemberSelectAll listS.size() >>> : " + listS.size());
				
				model.addAttribute("listS", listS);
				return "mem/memSelect";
			}
			
			return "mem/memSelectAll";
		}
		
		@GetMapping("oeIdCheck")
		@ResponseBody
		public Object oeIdCheck(OeMemVO ovo) {
			logger.info("oeMemService 함수 진입 >>> :");		
			logger.info("oeMemService ovo.getOid()() >>> : " + ovo.getOid());			
			
			List<OeMemVO> list = oeMemService.oeIdCheck(ovo);			
			logger.info("kosIdCheck list.size() >>> : " + list.size());
			
			String msg = "";		
			if (list.size() == 0) {msg = "ID_YES";}  
			else { msg = "ID_NO";}  
			
			return msg;		
		}
		
		@GetMapping("memUpdate")
		public String oeMemUpdate(HttpServletRequest req, OeMemVO ovo) {
			logger.info("kosMemberUpdate 함수 진입 >>> :");	
			logger.info("oeMemService ovo.getOnum()() >>> : " + ovo.getOnum());	
			
			String opw = req.getParameter("opw");
			ovo.setOpw(opw);
			
			// 핸드폰 번호 
			String ohp = req.getParameter("ohp");
			String ohp1 = req.getParameter("ohp1");
			String ohp2 = req.getParameter("ohp2");
			ovo.setOhp(ohp+ohp1+ohp2);
						
			// 이메일 
			String oemail = req.getParameter("oemail");
			String oemail1 = req.getParameter("oemail1");		
			ovo.setOemail(oemail+"@"+oemail1);				
			
			// 도로명 주소, 지번 주소
			ovo.setOzonecode(req.getParameter("ozonecode"));
			ovo.setOroad(req.getParameter("oroad"));
			ovo.setOroaddetail(req.getParameter("oroaddetail"));
			ovo.setOjibun(req.getParameter("ojibun"));

			int nCnt = oeMemService.oeMemUpdate(ovo);
			
			if (nCnt == 1) {
				logger.info("kosMemberUpdate 함수 nCnt >>> : " + nCnt);
				
				return "mem/memUpdate";			
			}
			
			return "";
		}
		
		// 삭제
		@GetMapping("memDelete")
		public String oeMemDelete(OeMemVO ovo) {
			logger.info("kosMemberDelete 함수 진입 >>> :");
			logger.info("kosMemberDelete 함수 진입 ovo.getMnum() >>> :" + ovo.getOnum());
			
			int nCnt = oeMemService.oeMemDelete(ovo);
			
			if (nCnt == 1) {
				logger.info("kosMemberDelete 함수 nCnt >>> : " + nCnt);
				
				return "mem/memUpdate";	
			}
			
			return "";
		}
		@GetMapping("loginForm")
		public String oeLoginForm() {
			logger.info("oeLoginForm 함수 진입 >>> : ");	
			return "login/login";
		}
		
		@ResponseBody
		@PostMapping("loginCheck")
		public String oeLoginCheck(HttpServletRequest req, OeMemVO ovo, Model model) {
		    logger.info("oeLoginCheck 함수 진입 >>> : ");    

		    // 서비스 호출
		    List<OeMemVO> listLogin = oeMemService.oeLogin(ovo);

		    if (listLogin.size() == 1) { 
		        logger.info("listLogin.size() >>> : " + listLogin.size());

		        O_Session os = O_Session.getInstance();            
		        String oID = os.getSession(req);

		        if (oID != null && oID.equals(listLogin.get(0).getOid())) {                
		            logger.info("메인 페이지로 이동 하기 >>> : " + oID);
		            req.getSession().setAttribute("oid", listLogin.get(0).getOid()); // 세션에 oid 설정
		            req.getSession().setAttribute("user", listLogin.get(0));
		            model.addAttribute("listLogin", listLogin);
		            return "success"; // 로그인 성공 시 응답
		        } else {
		            os.setSession(req, ovo.getOid());
		            logger.info("세션부여 하기  >>> : " + ovo.getOid());
		            req.getSession().setAttribute("oid", ovo.getOid()); // 세션에 oid 설정
		            req.getSession().setAttribute("user", listLogin.get(0));
		            model.addAttribute("listLogin", listLogin);
		            return "success"; // 로그인 성공 시 응답
		        }
		    } else {
		        model.addAttribute("listLogin", listLogin);
		        return "failure"; // 로그인 실패 시 응답
		    }
		}

		
		@PostMapping("logout")
		public String logout(HttpServletRequest req) {
		    O_Session os = O_Session.getInstance();
		    os.invalidateSession(req);
		    return "redirect:main.jsp";
		}
}
