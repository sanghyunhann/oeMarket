package oe.market.comm.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oe.market.comm.vo.OeCommVO;

@Repository
public class OeCommDAOImpl implements OeCommDAO {
	Logger logger = LogManager.getLogger(OeCommDAOImpl.class);

	@Autowired(required = false)
	private SqlSessionTemplate sqlSession;

	// 댓글 입력
	@Override
	public int oeCommInsert(OeCommVO ocvo) {

		logger.info("OeCommInsert 함수 진입 >>> : ");
		return sqlSession.insert("oeCommInsert", ocvo);
	}

	@Override
	public List<OeCommVO> oeCommSelectAll(OeCommVO ocvo) {

		logger.info("OeCommSelectAll 함수 진입 >>> : ");
		return sqlSession.selectList("oeCommSelectAll", ocvo);
	}

	@Override
	public int oeCommDelete(OeCommVO ocvo) {

		logger.info("OeCommDelete 함수 진입 >>> : ");
		return sqlSession.update("oeCommDelete", ocvo);
	}
	
	@Override
    public String getCommentOwnerId(String cnum) {
        logger.info("getCommentOwnerId 함수 진입 >>> : ");
        return sqlSession.selectOne("getCommentOwnerId", cnum);
    }

}
