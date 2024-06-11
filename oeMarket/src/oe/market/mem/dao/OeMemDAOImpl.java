package oe.market.mem.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oe.market.mem.vo.OeMemVO;

@Repository
public class OeMemDAOImpl implements OeMemDAO {

	Logger logger = LogManager.getLogger(OeMemDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int oeMemInsert(OeMemVO ovo) {
		logger.info("dao insert");
		return sqlSession.insert("oeMemInsert", ovo);
	}


	@Override
	public List<OeMemVO> oeMemSelect(OeMemVO ovo) {
		logger.info("dao select");
		return sqlSession.selectList("oeMemSelect", ovo);
	}

	@Override
	public int oeMemUpdate(OeMemVO ovo) {
		logger.info("dao update");
		return sqlSession.update("oeMemUpdate", ovo);
	}

	@Override
	public int oeMemDelete(OeMemVO ovo) {
		logger.info("dao delete");
		return sqlSession.update("oeMemDelete", ovo);
	}

	@Override
	public List<OeMemVO> oeLogin(OeMemVO ovo) {
		logger.info("dao login");
		return sqlSession.selectList("oeLogin",ovo);
	}

	@Override
	public List<OeMemVO> oeIdCheck(OeMemVO ovo) {
		logger.info("dao idcheck");
		return sqlSession.selectList("oeIdCheck",ovo);
	}

}
