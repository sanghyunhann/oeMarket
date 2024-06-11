package oe.market.mem.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import oe.market.mem.dao.OeMemDAO;
import oe.market.mem.vo.OeMemVO;

@Service
@Transactional
public class OeMemServiceImpl implements OeMemService {
	
	private Logger logger = LogManager.getLogger(OeMemServiceImpl.class);
	
	@Autowired(required=false)
	private OeMemDAO oeMemDAO;
	
	@Override
	public int oeMemInsert(OeMemVO ovo) {
		logger.info("service insert");
		return oeMemDAO.oeMemInsert(ovo);
	}

	@Override
	public List<OeMemVO> oeMemSelect(OeMemVO ovo) {
		logger.info("service select");
		return oeMemDAO.oeMemSelect(ovo);
	}

	@Override
	public int oeMemUpdate(OeMemVO ovo) {
		logger.info("service update");
		return oeMemDAO.oeMemUpdate(ovo);
	}

	@Override
	public int oeMemDelete(OeMemVO ovo) {
		logger.info("service delete");
		return oeMemDAO.oeMemDelete(ovo);
	}

	@Override
	public List<OeMemVO> oeLogin(OeMemVO ovo) {
		logger.info("service oeLogin");
		return oeMemDAO.oeLogin(ovo);
	}

	@Override
	public List<OeMemVO> oeIdCheck(OeMemVO ovo) {
		logger.info("service idcheck");
		return oeMemDAO.oeIdCheck(ovo);
	}

}
