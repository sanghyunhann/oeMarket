package oe.market.common.chabun.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import oe.market.board.vo.OeBoardVO;
import oe.market.cart.vo.OeCartVO;
import oe.market.comm.vo.OeCommVO;
import oe.market.common.chabun.dao.OeChabunDAO;
import oe.market.like.vo.OeLikeVO;
import oe.market.mem.vo.OeMemVO;

@Service
@Transactional
public class OeChabunServiceImpl implements OeChabunService {

	Logger logger = LogManager.getLogger(OeChabunServiceImpl.class);
	
	@Autowired(required=false)
	private OeChabunDAO oeChabunDAO;
	
	@Override
	public OeMemVO getOeMemberChabun() {
		logger.info("service getOeMemberChabun");
		return oeChabunDAO.getOeMemberChabun();
	}

	@Override
	public OeBoardVO getOeBoardChabun() {
		logger.info("service getOeBoardChabun");
		return oeChabunDAO.getOeBoardChabun();
	}

	@Override
	public OeCommVO getOeCommChabun() {
		logger.info("service getOeCommChabun");
		return oeChabunDAO.getOeCommChabun();
	}

	@Override
	public OeLikeVO getOeLikeChabun() {
		logger.info("service getOeLikeChabun");
		return oeChabunDAO.getOeLikeChabun();
	}

	@Override
	public OeCartVO getOeCartChabun() {
		logger.info("service getOeCartChabun");
		return oeChabunDAO.getOeCartChabun();
	}

}
