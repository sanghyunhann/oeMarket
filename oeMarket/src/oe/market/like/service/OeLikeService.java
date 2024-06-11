package oe.market.like.service;

import java.util.List;

import oe.market.like.vo.OeLikeVO;

public interface OeLikeService {
	
	public int oeLikeInsert(OeLikeVO ovo);
	public List<OeLikeVO> oeLikeSelect(OeLikeVO ovo);
	public List<OeLikeVO> oeLikeSelectAll(OeLikeVO ovo);
	
	public int oeLikeUpdate(OeLikeVO ovo);
}
