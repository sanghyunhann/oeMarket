package oe.market.comm.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import oe.market.board.vo.OeBoardVO;
import oe.market.comm.service.OeCommService;
import oe.market.comm.vo.OeCommVO;
import oe.market.common.ChabunUtil;
import oe.market.common.chabun.service.OeChabunService;

@Controller
public class OeCommController {
	Logger logger = LogManager.getLogger(OeCommController.class);

	// 컨트롤러 채번 서비스 연결
	@Autowired(required = false)
	private OeChabunService oeChabunService;

	// 컨트롤러에서 댓글 서비스 연결
	@Autowired(required = false)
	private OeCommService oeCommService;

	// 댓글 글쓰기 폼
	@GetMapping("commForm")
	public String oeCommForm(HttpServletRequest request, Model model) {
		logger.info("CommForm 함수 진입 : ");
		
	    // 세션에서 로그인된 사용자 정보 가져오기
	    String oid = (String) request.getSession().getAttribute("oid");
		
	    // OeBoardVO 객체 생성 및 oid 설정
	    OeBoardVO obvo = new OeBoardVO();
	    obvo.setOid(oid);
	    logger.info("oid : " + obvo.getOid());
	    
	    // 모델에 추가하여 JSP 페이지에서 접근할 수 있도록 설정
	    model.addAttribute("obvo", obvo);

		return "comm/commForm";
	}

	// 댓글 등록
	@PostMapping("oeCommInsert")
	@ResponseBody
	public String oeCommInsert(HttpServletRequest request, OeCommVO ocvo) {
	    logger.info("oeCommInsert >>> : ");
	    logger.info("oeCommInsert ocvo.getBnum() >>> : " + ocvo.getBnum());

	    // 세션에서 로그인된 사용자 정보 가져오기
	    String oid = (String) request.getSession().getAttribute("oid");

	    // 로그인되지 않은 경우 댓글 작성 불가
	    if (oid == null || oid.isEmpty()) {
	        return "NOT_LOGGED_IN"; // 로그인되지 않았음을 클라이언트에게 알림
	    }

	    // 채번 구하기 (board 게시판)
	    String cnum = ChabunUtil.getOeCommChabun("N", oeChabunService.getOeCommChabun().getCnum());
	    logger.info("oeCommInsert cnum >>> : " + cnum);

	    ocvo.setCnum(cnum);
	    ocvo.setOid(oid); // 로그인된 사용자의 아이디를 댓글 작성자로 설정
	    logger.info("ocvo.getCnum() >>> : " + ocvo.getCnum());
	    logger.info("ocvo.getBnum() >>> : " + ocvo.getBnum());
	    logger.info("ocvo.getOid() >>> : " + ocvo.getOid());
	    logger.info("ocvo.getCcontent() >>> : " + ocvo.getCcontent());

	    int nCnt = oeCommService.oeCommInsert(ocvo);
	    logger.info("oeCommInsert nCnt >>> : " + nCnt);

	    if (1 == nCnt) {
	        return "GOOD"; // 댓글 등록 성공을 클라이언트에게 알림
	    } else {
	        return "BAD"; // 댓글 등록 실패를 클라이언트에게 알림
	    }
	}

	// 댓글 전체 조회
	@PostMapping("oeCommSelectAll")
	@ResponseBody
	public String oeCommSelectAll(OeCommVO ocvo) {
		logger.info("oeCommSelectAll >>> : ");
		// rbvo.setSbnum("B0001");
		logger.info("oeCommSelectAll ocvo.getBnum() >>> : " + ocvo.getBnum());

	    List<OeCommVO> list = oeCommService.oeCommSelectAll(ocvo);
	    logger.info("oeCommSelectAll list >>> : " + list);

	    StringBuilder listStr = new StringBuilder();

	    for (OeCommVO _ocvo : list) {
	        String s0 = _ocvo.getCnum();
	        String s1 = _ocvo.getOid();
	        String s2 = _ocvo.getCcontent();
	        String s3 = _ocvo.getInsertdate();

	        try {
	            if (s1 != null) {
	                s1 = URLEncoder.encode(s1, "UTF-8").replace("+", "%20");
	            }
	            if (s2 != null) {
	                s2 = URLEncoder.encode(s2, "UTF-8").replace("+", "%20");
	            }
	        } catch (UnsupportedEncodingException e) {
	            e.printStackTrace();
	        }

	        String ss = s0 + "," + s1 + "," + s2 + "," + s3;
	        listStr.append(ss).append("&");
	    }

	    // 마지막 '&' 제거
	    if (listStr.length() > 0) {
	        listStr.setLength(listStr.length() - 1);
	    }

	    return listStr.toString();
		
	}
	


	// 댓글 삭제
	@PostMapping("oeCommDelete")
	@ResponseBody
    public String oeCommDelete(HttpServletRequest request, OeCommVO ocvo) {
        logger.info("oeCommDelete >>> : ");
        logger.info("oeCommDelete ocvo.getCnum() >>> : " + ocvo.getCnum());

        String loggedInUserId = (String) request.getSession().getAttribute("oid");
        String commentOwnerId = oeCommService.getCommentOwnerId(ocvo.getCnum());

        if (loggedInUserId != null && loggedInUserId.equals(commentOwnerId)) {
            int nCnt = oeCommService.oeCommDelete(ocvo);
            logger.info("OeCommDelete nCnt >>> : " + nCnt);

            if (1 == nCnt) {
                return "GOOD";
            } else {
                return "BAD";
            }
        } else {
            return "NOT_ALLOWED";
        }
    }

}
