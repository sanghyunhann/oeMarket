// OeCartServiceImpl.java
package oe.market.cart.service;

import java.util.List;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import oe.market.cart.dao.OeCartDAO;
import oe.market.cart.vo.OeCartVO;

@Service
@Transactional
public class OeCartServiceImpl implements OeCartService {
    Logger logger = LogManager.getLogger(OeCartServiceImpl.class);

    @Autowired
    private OeCartDAO oeCartDAO;

    @Override
    public int oeCartInsert(OeCartVO ocvo) {
        logger.info("service insert");
        return oeCartDAO.oeCartInsert(ocvo);
    }

    @Override
    public List<OeCartVO> oeCartSelect(OeCartVO ocvo) {
        logger.info("service select");
        return oeCartDAO.oeCartSelect(ocvo);
    }

    @Override
    public int oeCartUpdate(OeCartVO ocvo) {
        logger.info("service update");
        return oeCartDAO.oeCartUpdate(ocvo);
    }

    @Override
    public OeCartVO oeCartCheck(OeCartVO ocvo) {
        logger.info("service check");
        return oeCartDAO.oeCartCheck(ocvo);
    }
}
