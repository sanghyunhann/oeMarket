package oe.market.board.controller;

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

import oe.market.board.service.OeBoardService;
import oe.market.board.vo.OeBoardVO;
import oe.market.common.ChabunUtil;
import oe.market.common.CommonUtils;
import oe.market.common.FileUploadUtil;
import oe.market.common.chabun.service.OeChabunService;

@Controller
public class OeBoardController {
	Logger logger = LogManager.getLogger(OeBoardController.class);
	
	@Autowired(required=false)
	private OeChabunService oeChabunService;
	
	@Autowired(required=false)
	private OeBoardService oeBoardService;
	
	@GetMapping("boardForm")
	public String oeBoardForm(HttpServletRequest request, Model model) {
	    logger.info("oeBoardForm 함수진입 >>> ");
	    
	    // 세션에서 로그인된 사용자 정보 가져오기
	    String oid = (String) request.getSession().getAttribute("oid");
	    
	    if (oid == null || oid.isEmpty()) {
	        // 로그인되지 않은 경우 알림창을 통해 로그인 페이지로 이동
	        model.addAttribute("loginRequired", true);
	        return "board/boardSelectAll"; // 로그인 페이지가 아니라 게시판 목록 페이지로 리다이렉트
	    }
	    
	    // OeBoardVO 객체 생성 및 oid 설정
	    OeBoardVO obvo = new OeBoardVO();
	    obvo.setOid(oid);
	    logger.info("oid : " + obvo.getOid());
	    
	    // 모델에 추가하여 JSP 페이지에서 접근할 수 있도록 설정
	    model.addAttribute("obvo", obvo);
	    model.addAttribute("loginRequired", false);
	    
	    return "board/boardForm";
	}



	//글쓰기
	@PostMapping("boardInsert")
	public String oeBoardInsert(HttpServletRequest req) {
		logger.info("oeBoardInsert 함수진 입 >>> :");
		
		String num = oeChabunService.getOeBoardChabun().getBnum();
		logger.info("oeBoardInsert num>>>: " +num);
		String bnum = ChabunUtil.getBoardChabun("N", num);
		logger.info("oeBoardInsert bnum >>> : " + bnum);
		//이미지 업로드
		FileUploadUtil fu = new FileUploadUtil(  CommonUtils.IMG_UPLOAD_PATH
								                ,CommonUtils.IMG_FILE_SIZE
								                ,CommonUtils.IMG_EN_CODE);
		//이미지 파일 원본 사이즈
		boolean bool = fu.imgfileUpload(req);
		logger.info("oeBoardInsert bool >>> : " +bool);
		
		OeBoardVO _obvo = null;
		_obvo = new OeBoardVO();
		
		_obvo.setBnum(bnum);
		_obvo.setOid(fu.getParameter("oid"));
		_obvo.setBtitle(fu.getParameter("btitle"));
		_obvo.setBphoto(fu.getFileName("bphoto"));
		_obvo.setBcontent(fu.getParameter("bcontent"));
		_obvo.setBprice(fu.getParameter("bprice"));
		_obvo.setBpw(fu.getParameter("bpw"));
		
		//서비스 호출
		int nCnt = oeBoardService.oeBoardInsert(_obvo);
		if(nCnt>0) {
			logger.info("oeBoardInsert nCnt >>> : " +nCnt);
			return "board/boardInsert";
		}
		return "board/boardForm";
		
	}
	 @GetMapping("boardSelectAll")
	    public String oeBoardSelectAll(OeBoardVO obvo, Model model, HttpServletRequest request) {
	        logger.info("oeBoardSelectAll 함수진입 >>> : ");

	        // 로그인 여부 체크
	        String oid = (String) request.getSession().getAttribute("oid");
	        if (oid == null || oid.isEmpty()) {
	            request.getSession().setAttribute("loginRequired", true);
	        } else {
	            request.getSession().setAttribute("loginRequired", false);
	        }

	        // 페이징
	        int pageSize = CommonUtils.BOARD_PAGE_SIZE;
	        int groupSize = CommonUtils.BOARD_GROUP_SIZE;
	        int curPage = CommonUtils.BOARD_CUR_PAGE;
	        int totalCount = CommonUtils.BOARD_TOTAL_COUNT;

	        if (obvo.getCurPage() != null) {
	            curPage = Integer.parseInt(obvo.getCurPage());
	        }

	        obvo.setPageSize(String.valueOf(pageSize));
	        obvo.setGroupSize(String.valueOf(groupSize));
	        obvo.setCurPage(String.valueOf(curPage));
	        obvo.setTotalCount(String.valueOf(totalCount));

	        logger.info("oeBoardFileUploadSelectAll obvo.getPageSize() >>> :  " + obvo.getPageSize());
	        logger.info("oeBoardFileUploadSelectAll obvo.getGroupSize() >>> :  " + obvo.getGroupSize());
	        logger.info("oeBoardFileUploadSelectAll obvo.getCurPage() >>> :   " + obvo.getCurPage());
	        logger.info("oeBoardFileUploadSelectAll obvo.getTotalCount() >>> : " + obvo.getTotalCount());

	        // 서비스 호출
	        List<OeBoardVO> listAll = oeBoardService.oeBoardSelectAll(obvo);
	        if (listAll.size() > 0) {
	            logger.info("oeBoardSelectAll listAll.size()>>> : " + listAll.size());

	            model.addAttribute("pagingOBVO", obvo);
	            model.addAttribute("listAll", listAll);
	            return "board/boardSelectAll";
	        }
	        return "board/boardSelectAll";
	    }
	
		//게시글 조회
	@GetMapping("boardSelect")
	public String oeBoardSelect(OeBoardVO obvo, Model model) {
		logger.info("oeBoardSelect 함수진입 >>> : ");
		
		logger.info("oeBoardSelect 함수진입 >>> : " +obvo.getBnum());
		
		//서비스 호출
		List<OeBoardVO> listS =oeBoardService.oeBoardSelect(obvo);
		if(listS.size()==1) {
			logger.info("oeBoardSelect listS.size()>>>: " +listS.size());
			
			int bhitCnt = oeBoardService.oeBoardBhit(obvo);
			logger.info("oeBoardSelect bhitCnt>>> : " +bhitCnt);
			
			model.addAttribute("listS", listS);
			return "board/boardSelect";
		}
		return "board/boardSelectAll";
	}
	
	//게시글 내용보기
	@GetMapping("boardSelectContents")
	public String oeBoardSelectContents(OeBoardVO obvo, Model model) {
		logger.info("oeBoardSelectContents 함수진입 >>> :" );
		
		logger.info("oeBoardSelectContents 함수진입  obvo.getBnum()>>>: " +obvo.getBnum());
		
		//서비스호출
		List<OeBoardVO> listS = oeBoardService.oeBoardSelect(obvo);
		if(listS.size()==1) {
			logger.info("oeBoardSelect listS.size()>>>: " +listS.size());
			
			int bhitCnt = oeBoardService.oeBoardBhit(obvo);
			logger.info("oeBoardSelect bhitCnt>>> : " + bhitCnt);
			
			model.addAttribute("listS", listS);
			return "board/boardSelectContents";
		}
		return "board/boardSelectAll";
	}
	//게시글 수정
	@GetMapping("boardUpdate")
	public String oeBoardUpdate(OeBoardVO obvo, Model model) {
		logger.info("oeBoardUpdate 함수진입 >>> : " );
		logger.info("oeBoardDelete 함수진입  obvo.getBnum()>>> : "+obvo.getBnum());
		
		int nCnt = oeBoardService.oeBoardUpdate(obvo);
		
		if(nCnt>0) {
			logger.info("oeBoardUpdate nCnt>>>: " +nCnt);
			return "board/boardUpdate";
		}
		return "#";
	}
	//게시글 삭제
	@GetMapping("boardDelete")
	public String oeBoardDelete(OeBoardVO obvo, Model model) {
		logger.info("oeBoardDelete 함수진입 >>> : ");
		logger.info("oeBoardDelete 함수진입 >>> : " +obvo.getBnum());
		
		int nCnt = oeBoardService.oeBoardDelete(obvo);
		
		if(nCnt>0) {
			logger.info("oeBoardDelete nCnt >>> : " +nCnt);
			return "board/boardDelete";
		}
		return "#";
	}
	//패스워드 체크하기
	
	@PostMapping("boardPwCheck")
	@ResponseBody
	public Object oeBoardPwCheck(OeBoardVO obvo){
		logger.info("oeBoardPwCheck 함수진입 >>> : ");
		logger.info("oeBoardPwCheck obvo.getBpw()()>>> : " + obvo.getBpw());
		
		List<OeBoardVO> list = oeBoardService.oeBoardPwCheck(obvo);
		logger.info("oeBoardPwCheck list.size()>>>: " + list.size());
		
		String msg ="";
		if(list.size()==1) {
			msg="ID_YES";
		}
		else {
			msg="ID_NO";
		}
		return msg;
	}
}
