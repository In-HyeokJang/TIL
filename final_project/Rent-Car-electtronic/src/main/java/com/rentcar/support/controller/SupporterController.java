package com.rentcar.support.controller;

import com.rentcar.support.model.Request;
import com.rentcar.support.model.Supporter;
import com.rentcar.support.service.RequestServiceImpl;
import com.rentcar.support.service.SupportServiceImpl;
import com.rentcar.support.service.WhereSet;
import com.rentcar.utility.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.net.URLDecoder;

/*
    지원 차량 정보 저장 및 관리
 */

@Controller
@RequestMapping("/admin")
public class SupporterController {

    @Autowired
    private RequestServiceImpl requestService;

    @Autowired
    private SupportServiceImpl supportService;

    // 한개의 서포터 정보 읽어오기
    @GetMapping("/read/{carnum}")
    public Supporter sup(@RequestParam("carnum") String carnum){
        return supportService.read(carnum);
    }

    @GetMapping("/support/create")
    public String create(){
        return "/supporter/create";
    }

    // 서포트 리스트
    @GetMapping("/support/list")
    public String support_list(HttpServletRequest request){

        String col = Utility.checkNull(request.getParameter("col"));
        String word = Utility.checkNull(request.getParameter("word"));

        if (col.equals("total")) {
            word = "";
        }

        int nowPage = 1;// 현재 보고있는 페이지 (처음들어왔을때 페이지??)
        if (request.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }
        int recordPerPage = 5;

        // DB에서 가져올 순번-----------------
        int sno = ((nowPage - 1) * recordPerPage) ;

        Map map = new HashMap();
        map.put("col", col); // select tag
        map.put("word", word); // 검색어
        map.put("sno", sno); // 현제 페이지 번호
        map.put("cnt", recordPerPage); // 페이지당 표시할 글 수

        int total = supportService.total(map);
        System.out.println(total);
        List<Supporter> list = supportService.list(map);

        String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

        // request에 Model사용 결과 담는다
        request.setAttribute("list", list);
        request.setAttribute("nowPage", nowPage);
        request.setAttribute("col", col);
        request.setAttribute("word", word);
        request.setAttribute("paging", paging);

        return "/supporter/list";
    }

    final int recordPerPage = 3;// 한페이지당 보여줄 레코드갯수
    public int nowPage = 1;// 현재 보고있는 페이지

    // 관리자가 보는 request 리스트
    @GetMapping("/request/list")
    public String request_list(HttpServletRequest request) {

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
        List<Request> list = requestService.list(map);

        String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

        // request에 Model사용 결과 담는다
        request.setAttribute("list", list);
        request.setAttribute("nowPage", nowPage);
        request.setAttribute("col", col);
        request.setAttribute("word", word);
        request.setAttribute("paging", paging);

        return "/request/list";
    }


}
