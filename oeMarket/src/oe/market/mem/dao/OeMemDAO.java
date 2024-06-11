package oe.market.mem.dao;

import java.util.List;

import oe.market.mem.vo.OeMemVO;

public interface OeMemDAO {

	int oeMemInsert(OeMemVO ovo);;
	List<OeMemVO> oeMemSelect(OeMemVO ovo);
	int oeMemUpdate(OeMemVO ovo);
	int oeMemDelete(OeMemVO ovo);
	
	List<OeMemVO> oeLogin(OeMemVO ovo);
	List<OeMemVO> oeIdCheck(OeMemVO ovo);
	
}
