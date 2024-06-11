package oe.market.like.dao;

import java.util.List;

import oe.market.like.vo.OeLikeVO;

public interface OeLikeDAO {

		public int oeLikeInsert(OeLikeVO ovo);
		public List<OeLikeVO> oeLikeSelect(OeLikeVO ovo);
		public List<OeLikeVO> oeLikeSelectAll(OeLikeVO ovo);
		
		public int oeLikeUpdate(OeLikeVO ovo);
}
