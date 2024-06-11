package oe.market.board.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import oe.market.board.dao.OeBoardDAO;
import oe.market.board.vo.OeBoardVO;

@Service
@Transactional
public class OeBoardServiceImpl implements OeBoardService {
	Logger logger = LogManager.getLogger(OeBoardServiceImpl.class);
	
	@Autowired(required=false)		
	private OeBoardDAO oeBoardDAO;

	@Override
	public int oeBoardInsert(OeBoardVO obvo) {
		// TODO Auto-generated method stub
		logger.info("oeBoardInsert 함수 진입 >>> : ");			
		return oeBoardDAO.oeBoardInsert(obvo);
	}

	@Override
	public List<OeBoardVO> oeBoardSelectAll(OeBoardVO obvo) {
		// TODO Auto-generated method stub
		logger.info("oeBoardSelectALl 함수 진입 >>> : ");
		return oeBoardDAO.oeBoardSelectAll(obvo);
	}

	@Override
	public List<OeBoardVO> oeBoardSelect(OeBoardVO obvo) {
		// TODO Auto-generated method stub
		logger.info("oeBoardSelect 함수 진입 >>> : ");
		return oeBoardDAO.oeBoardSelect(obvo);
	}
	@Override
	public List<OeBoardVO> oeBoardPwCheck(OeBoardVO obvo) {
		// TODO Auto-generated method stub
		logger.info("oeBoardPwCheck 함수 진입 >>> : ");			
		return oeBoardDAO.oeBoardPwCheck(obvo);
	}


	@Override
	public int oeBoardBhit(OeBoardVO obvo) {
		// TODO Auto-generated method stub
		logger.info("oeBoardBhit 함수 진입 >>> : ");
		return oeBoardDAO.oeBoardBhit(obvo);
	}

	@Override
	public int oeBoardUpdate(OeBoardVO obvo) {
		// TODO Auto-generated method stub
		logger.info("oeBoardUpdate 함수 진입 >>> : ");
		return oeBoardDAO.oeBoardUpdate(obvo);
	}

	@Override
	public int oeBoardDelete(OeBoardVO obvo) {
		// TODO Auto-generated method stub
		logger.info("oeBoardDelete 함수 진입 >>> : ");
		return oeBoardDAO.oeBoardDelete(obvo);
	}

}
