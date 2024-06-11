package oe.market.common.chabun.dao;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oe.market.board.vo.OeBoardVO;
import oe.market.cart.vo.OeCartVO;
import oe.market.comm.vo.OeCommVO;
import oe.market.like.vo.OeLikeVO;
import oe.market.mem.vo.OeMemVO;

@Repository
public class OeChabunDAOImpl implements OeChabunDAO {

	Logger logger = LogManager.getLogger(OeChabunDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public OeMemVO getOeMemberChabun() {
		logger.info("getOeMemberChabun");
		return sqlSession.selectOne("getOeMemberChabun");
	}

	@Override
	public OeBoardVO getOeBoardChabun() {
		logger.info("getOeBoardChabun");
		return sqlSession.selectOne("getOeBoardChabun");
	}

	@Override
	public OeCommVO getOeCommChabun() {
		logger.info("getOeCommChabun");
		return sqlSession.selectOne("getOeCommChabun");
	}

	@Override
	public OeLikeVO getOeLikeChabun() {
		logger.info("getOeLikeChabun");
		return sqlSession.selectOne("getOeLikeChabun");
	}

	@Override
	public OeCartVO getOeCartChabun() {
		logger.info("getOeCartChabun");
		return sqlSession.selectOne("getOeCartChabun");
	}

}
