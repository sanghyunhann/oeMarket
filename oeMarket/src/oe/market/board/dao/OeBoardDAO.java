package oe.market.board.dao;

import java.util.List;

import oe.market.board.vo.OeBoardVO;

public interface OeBoardDAO {
	public int oeBoardInsert(OeBoardVO obvo);
	public List<OeBoardVO> oeBoardSelectAll(OeBoardVO obvo);
	public List<OeBoardVO> oeBoardSelect(OeBoardVO obvo);	
	
	public List<OeBoardVO> oeBoardPwCheck(OeBoardVO obvo);
	

	public int oeBoardBhit(OeBoardVO obvo);
	
	
	public int oeBoardUpdate(OeBoardVO obvo);
	
	public int oeBoardDelete(OeBoardVO obvo);
}
