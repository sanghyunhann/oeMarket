package oe.market.like.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import oe.market.like.dao.OeLikeDAO;
import oe.market.like.vo.OeLikeVO;

@Service
@Transactional
public class OeLikeServiceImpl implements OeLikeService {
	Logger logger = LogManager.getLogger(OeLikeServiceImpl.class);
	
	// 서비스에서 DAO 연결하기 
	// 필드 @Autowired 어노테이션으로  DI (의존성 주입하기)
	@Autowired(required=false)
	private OeLikeDAO oeLikeDAO;
	
	@Override
	public int oeLikeInsert(OeLikeVO ovo) {
		
		logger.info("oeLikeInsert 진입 >>> : ");
		
		return oeLikeDAO.oeLikeInsert(ovo);
	}

	@Override
	public List<OeLikeVO> oeLikeSelect(OeLikeVO ovo) {
		
		logger.info("oeLikeSelect 진입 >>> : ");
		
		return oeLikeDAO.oeLikeSelect(ovo);
	}

	@Override
	public List<OeLikeVO> oeLikeSelectAll(OeLikeVO ovo) {
		
		logger.info("oeLikeSelectAll 진입 >>> : ");
		
		return oeLikeDAO.oeLikeSelectAll(ovo);
	}

	@Override
	public int oeLikeUpdate(OeLikeVO ovo) {

		logger.info("oeLikeUpdate 진입 >>> : ");
		
		return oeLikeDAO.oeLikeUpdate(ovo);
	}

}
