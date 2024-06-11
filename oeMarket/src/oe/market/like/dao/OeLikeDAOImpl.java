package oe.market.like.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oe.market.like.vo.OeLikeVO;

@Repository
public class OeLikeDAOImpl implements OeLikeDAO {
	Logger logger = LogManager.getLogger(OeLikeDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public int oeLikeInsert(OeLikeVO ovo) {
		
		logger.info("oelikeInsert 진입 >>> : ");
		
		return (Integer)sqlSession.insert("oeLikeInsert", ovo);
	}

	@Override
	public List<OeLikeVO> oeLikeSelect(OeLikeVO ovo) {
		
		logger.info("oeLikeSelect 진입 >>> : ");
		
		return sqlSession.selectList("oeLikeSelect", ovo);
	}

	@Override
	public List<OeLikeVO> oeLikeSelectAll(OeLikeVO ovo) {
		
		logger.info("oeLikeSelectAll 진입 >>> : ");
		
		return sqlSession.selectList("oeLikeSelectAll", ovo);
	}

	@Override
	public int oeLikeUpdate(OeLikeVO ovo) {
		
		logger.info("oeLikeUpdate 진입 >>> : ");
		
		return (Integer)sqlSession.update("oeLikeUpdate", ovo);
	}

}
