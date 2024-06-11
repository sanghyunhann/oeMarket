package oe.market.comm.service;

import java.util.List;

import oe.market.comm.vo.OeCommVO;

public interface OeCommService {
	
	public int oeCommInsert(OeCommVO ocvo);
	public List<OeCommVO> oeCommSelectAll(OeCommVO ocvo);
	public int oeCommDelete(OeCommVO ocvo);
	public String getCommentOwnerId(String cnum);

}
