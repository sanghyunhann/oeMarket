package oe.market.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import oe.market.cart.service.OeCartService;
import oe.market.cart.vo.OeCartVO;
import oe.market.common.ChabunUtil;
import oe.market.common.chabun.service.OeChabunService;

@Controller
public class OeCartController {
    Logger logger = LogManager.getLogger(OeCartController.class);

    @Autowired
    private OeCartService oeCartService;

    @Autowired(required = false)
    private OeChabunService oeChabunService;

    @PostMapping(value = "addCart", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public String addCart(OeCartVO ocvo, HttpServletRequest request, Model model) {
        logger.info("controller addCart");

        JSONObject res = new JSONObject();

        // 세션에서 로그인한 사용자의 아이디 가져오기
        String oid = (String) request.getSession().getAttribute("oid");
        if (oid == null || oid.isEmpty()) {
            res.put("loginRequired", true);
            res.put("message", "로그인이 필요합니다.");
            return res.toString();
        }

        // 로그인한 사용자의 아이디를 OeCartVO에 설정
        ocvo.setOid(oid);

        // 중복 확인
        OeCartVO existingCart = oeCartService.oeCartCheck(ocvo);
        if (existingCart != null) {
            // 이미 찜한 상태인 경우
            ocvo.setDeleteyn("N".equals(existingCart.getDeleteyn()) ? "Y" : "N");
            int updateCount = oeCartService.oeCartUpdate(ocvo);
            if (updateCount > 0) {
                res.put("status", "success");
                res.put("message", "Y".equals(ocvo.getDeleteyn()) ? "찜하기에 성공했습니다." : "이미 나의 찜목록에 들어가 있는 게시글입니다. 찜하기를 취소하였습니다.");
            } else {
                res.put("status", "fail");
                res.put("message", "찜 상태 변경에 실패했습니다.");
            }
        } else {
            // 신규 찜 추가 처리
            String ocnum = ChabunUtil.getMemberChabun("D", oeChabunService.getOeCartChabun().getOcnum());
            ocvo.setOcnum(ocnum);
            ocvo.setDeleteyn("Y");

            int nCnt = oeCartService.oeCartInsert(ocvo);

            if (nCnt > 0) {
                res.put("status", "success");
                res.put("message", "찜하기에 성공했습니다.");
            } else {
                res.put("status", "fail");
                res.put("message", "찜하기에 실패했습니다.");
            }
        }

        return res.toString();
    }
    
    @GetMapping("cartList")
    public String oeCartSelect(OeCartVO ocvo, Model model, HttpServletRequest request) {
        logger.info("oeCartSelect 함수진입 >>> : ");

        // 세션에서 로그인한 사용자의 아이디 가져오기
        String oid = (String) request.getSession().getAttribute("oid");
        if (oid == null || oid.isEmpty()) {
        	model.addAttribute("loginRequired", true);
            return "login/login";
        }

        logger.info("로그인한 사용자 OID >>> : " + oid);

        // OeCartVO 객체에 아이디 설정
        ocvo.setOid(oid);

        List<OeCartVO> list = oeCartService.oeCartSelect(ocvo);
        logger.info("조회된 찜한 게시글 수 >>> : " + list.size());

        model.addAttribute("cartList", list);
        return "cart/cartSelect";
    }
}
