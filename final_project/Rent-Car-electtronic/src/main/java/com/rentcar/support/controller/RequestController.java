package com.rentcar.support.controller;

import com.rentcar.support.model.Request;
import com.rentcar.support.model.Supporter;
import com.rentcar.support.service.RequestServiceImpl;
import com.rentcar.support.service.SupportServiceImpl;
import com.rentcar.support.service.WhereSet;
import com.rentcar.utility.Utility;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
요청 페이지
 */

@Slf4j
@Controller
@RequestMapping("/user")
public class RequestController {

    final int recordPerPage = 3;// 한페이지당 보여줄 레코드갯수
    public int nowPage = 1;// 현재 보고있는 페이지

    Logger logger = LoggerFactory.getLogger(RequestController.class);


    @Autowired
    private SupportServiceImpl supportService;

    /*
   검색 기능 구현
   col : select tag 선택 요소
   word : 검색어
    */

    // 요청 등록 페이지
    @GetMapping("/request/create")
    public String repuest() {
        return "/request/create";
    }



    // help 요청에 대한 지원 차량 선택 페이지
    @GetMapping("/request/supporter")
    public String supporter_list(HttpServletRequest request) {

        String col = Utility.checkNull(request.getParameter("col"));
        String word = Utility.checkNull(request.getParameter("word"));

        if (col.equals("total")) {
            word = "";
        }

        if (request.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }

        Map map = WhereSet.SQLWhereSet(request, col, word);

        int total = supportService.total(map);
        List<Supporter> list = supportService.cansurpport(map);

        String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

        // request에 Model사용 결과 담는다
        request.setAttribute("list", list);
        request.setAttribute("nowPage", nowPage);
        request.setAttribute("col", col);
        request.setAttribute("word", word);
        request.setAttribute("paging", paging);

        return "/request/supporter";
    }

}
