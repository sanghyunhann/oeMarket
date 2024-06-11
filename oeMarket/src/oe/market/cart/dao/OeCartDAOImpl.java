package oe.market.cart.dao;

import java.util.List;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import oe.market.cart.vo.OeCartVO;

@Repository
public class OeCartDAOImpl implements OeCartDAO {
    Logger logger = LogManager.getLogger(OeCartDAOImpl.class);

    @Autowired(required=false)
    private SqlSessionTemplate sqlSession;

    @Override
    public int oeCartInsert(OeCartVO ocvo) {
        logger.info("dao insert");
        return sqlSession.insert("oeCartInsert", ocvo);
    }

    @Override
    public List<OeCartVO> oeCartSelect(OeCartVO ocvo) {
        logger.info("dao select");
        return sqlSession.selectList("oeCartSelect", ocvo);
    }

    @Override
    public int oeCartUpdate(OeCartVO ocvo) {
        logger.info("dao update");
        return sqlSession.update("oeCartUpdate", ocvo);
    }

    @Override
    public OeCartVO oeCartCheck(OeCartVO ocvo) {
        logger.info("dao 중복체크");
        return sqlSession.selectOne("oeCartCheck", ocvo);
    }
}
