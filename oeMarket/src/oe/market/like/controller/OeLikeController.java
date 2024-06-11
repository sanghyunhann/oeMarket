package oe.market.like.controller;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import oe.market.like.service.OeLikeService;
import oe.market.like.vo.OeLikeVO;

@Controller
public class OeLikeController {
	Logger logger = LogManager.getLogger(OeLikeController.class);
	
	//필드 오토와이어드
	@Autowired(required=false)
	private OeLikeService oeLikeService;
	
	//likecnt 등록
	@GetMapping("likecnt")
	@ResponseBody
	public String oeLikecnt(OeLikeVO ovo) {
		logger.info("oeLikecnt >>> : ");
		
		logger.info("oeLikecnt ovo.getLikecnt() >>> : " + ovo.getLikecnt());
		logger.info("oeLikecnt ovo.getBnum() >>> : " + ovo.getBnum());
		logger.info("oeLikecnt ovo.getOnum() >>> : " + ovo.getOnum());
		
		List<OeLikeVO> listCnt = oeLikeService.oeLikeSelect(ovo);
		logger.info("oeLikecnt listCnt >>> : " + listCnt);
		
		int nCnt = 0;
		if (listCnt !=null && listCnt.size() > 0) {
			nCnt = oeLikeService.oeLikeUpdate(ovo);
			logger.info("oeLikecnt nCnt >>> : " + nCnt);
		} else {
			
			nCnt = oeLikeService.oeLikeInsert(ovo);
			logger.info("oeLikecnt nCnt >>> : " + nCnt);
		}
		
		String blikecnt = "";
		List<OeLikeVO> listAll = oeLikeService.oeLikeSelectAll(ovo);
		if(listAll !=null && listAll.size() > 0) {
			blikecnt = listAll.get(0).getLikecnt();
		}
		
		return blikecnt;
	}
	
}
