// OeCartService.java
package oe.market.cart.service;

import java.util.List;
import oe.market.cart.vo.OeCartVO;

public interface OeCartService {
   public int oeCartInsert(OeCartVO ocvo);
   public List<OeCartVO> oeCartSelect(OeCartVO ocvo);
   public int oeCartUpdate(OeCartVO ocvo);
   public OeCartVO oeCartCheck(OeCartVO ocvo); // 새로운 메소드
}
