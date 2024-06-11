package oe.market.board.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oe.market.board.vo.OeBoardVO;

@Repository
public class OeBoardDAOImpl implements OeBoardDAO {
	Logger logger = LogManager.getLogger(OeBoardDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int oeBoardInsert(OeBoardVO obvo) {
		// TODO Auto-generated method stub
		logger.info("oeBoardInsert 함수진입 >>>: ");
		
		return sqlSession.insert("oeBoardInsert", obvo);
	}

	@Override
	public List<OeBoardVO> oeBoardSelectAll(OeBoardVO obvo) {
		// TODO Auto-generated method stub
		logger.info("oeBoardSelectAll 함수진입 >>> : " );
		return sqlSession.selectList("oeBoardSelectAll", obvo);
	}

	@Override
	public List<OeBoardVO> oeBoardSelect(OeBoardVO obvo) {
		// TODO Auto-generated method stub
		logger.info("oeBoardSelect 함수진입 >>> : " );
		return sqlSession.selectList("oeBoardSelect", obvo);
	}
	@Override
	public List<OeBoardVO> oeBoardPwCheck(OeBoardVO obvo) {
		// TODO Auto-generated method stub
		logger.info("oeBoardPwCheck 함수 진입 >>> : ");	
		
		return sqlSession.selectList("oeBoardPwCheck", obvo);
	}

	@Override
	public int oeBoardBhit(OeBoardVO obvo) {
		// TODO Auto-generated method stub
		logger.info("oeBoardBhit함수진입 >>> : ");
		
		return sqlSession.update("oeBoardBhit", obvo);
	}

	@Override
	public int oeBoardUpdate(OeBoardVO obvo) {
		// TODO Auto-generated method stub
		logger.info("oeBoardUpdate 함수진입 >>> : ");
		
		return sqlSession.update("oeBoardUpdate", obvo);
	}


	@Override
	public int oeBoardDelete(OeBoardVO obvo ) {
		logger.info("oeBoardDelete 함수진입 >>> : ");
		
		return sqlSession.delete("oeBoardDelete", obvo);
	}

}
