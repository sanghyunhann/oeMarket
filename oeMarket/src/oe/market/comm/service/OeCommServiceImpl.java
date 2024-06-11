package oe.market.comm.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import oe.market.comm.dao.OeCommDAO;
import oe.market.comm.vo.OeCommVO;

@Service
@Transactional
public class OeCommServiceImpl implements OeCommService {
	Logger logger = LogManager.getLogger(OeCommServiceImpl.class);
	
	// 서비스에서 DAO 연결하기 
	// 필드 @Autowired 어노테이션으로  DI (의존성 주입하기)
	@Autowired(required=false)	
	private OeCommDAO oeCommDAO;
	
	@Override
	public int oeCommInsert(OeCommVO ocvo) {
		
		logger.info("OeCommInsert 함수 진입 >>> : ");			
		return oeCommDAO.oeCommInsert(ocvo);
	}

	@Override
	public List<OeCommVO> oeCommSelectAll(OeCommVO ocvo) {
		
		logger.info("OeCommSelectAll 함수 진입 >>> : ");			
		return oeCommDAO.oeCommSelectAll(ocvo);
	}

	@Override
	public int oeCommDelete(OeCommVO ocvo) {
		
		logger.info("OeCommDelete 함수 진입 >>> : ");			
		return oeCommDAO.oeCommDelete(ocvo);
	}

	@Override
	public String getCommentOwnerId(String cnum) {
	    logger.info("getCommentByCnum 함수 진입 >>> : ");
	    return oeCommDAO.getCommentOwnerId(cnum);
	}

}
