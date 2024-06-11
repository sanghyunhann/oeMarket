package oe.market.cart.dao;

import java.util.List;
import oe.market.cart.vo.OeCartVO;

public interface OeCartDAO {
   public int oeCartInsert(OeCartVO ocvo);
   public List<OeCartVO> oeCartSelect(OeCartVO ocvo);
   public int oeCartUpdate(OeCartVO ocvo);
   public OeCartVO oeCartCheck(OeCartVO ocvo); // 새로운 메소드
}
