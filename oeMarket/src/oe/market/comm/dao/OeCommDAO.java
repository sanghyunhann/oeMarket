package oe.market.comm.dao;

import java.util.List;

import oe.market.comm.vo.OeCommVO;

public interface OeCommDAO {
	
	public int oeCommInsert(OeCommVO ocvo);
	public List<OeCommVO> oeCommSelectAll(OeCommVO ocvo);
	public int oeCommDelete(OeCommVO ocvo);
	public String getCommentOwnerId(String cnum);

}
