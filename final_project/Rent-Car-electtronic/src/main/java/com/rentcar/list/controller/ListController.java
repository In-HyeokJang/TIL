package com.rentcar.list.controller;

import com.rentcar.list.model.ListDTO;
import com.rentcar.list.service.ListServiceImpl;
import com.rentcar.review.model.ReviewDTO;
import com.rentcar.review.service.ReviewServiceImpl;
import com.rentcar.utility.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user/contents")
public class ListController {

    @Autowired
    private ListServiceImpl service;

    @Autowired
    private ReviewServiceImpl rservice;


    @PostMapping("/list/delete")
    public String delete(int listno) {
        System.out.println("********************************" + listno);
        System.out.println("********************************" + listno);

        rservice.bdelete(listno);

        service.delete(listno);

        return "redirect:/user/contents/list";

    }

    @GetMapping("/list/update")
    public String update(int listno, Model model) {

        model.addAttribute("dto", service.read(listno));

        return "/list/update";
    }

    @PostMapping("/list/update")
    public String update(ListDTO dto) {
        Map map = new HashMap();
        map.put("listno", dto.getListno());
        service.update(dto);
        return "redirect:/contents/list";
    }

    @PostMapping("/list/{listno}")
    public String read(int listno) {
//        System.out.println("listno="+listno);
        service.recommend(listno);

        return "/list";
    }


    @GetMapping("/list/read")
    public String read(int listno, Model model, HttpServletRequest request) {


        service.upCnt(listno);

        ListDTO dto = service.read(listno);


        String content = dto.getContent().replaceAll("\r\n", "<br>");

        dto.setContent(content);

        model.addAttribute("dto", dto);

        int nPage = 1;
        if (request.getParameter("nPage") != null) {
            nPage = Integer.parseInt(request.getParameter("nPage"));
        }
        int recordPerPage = 100;


        //oracle
        //int sno = ((nPage - 1) * recordPerPage) + 1;
        //int eno = nPage * recordPerPage;
        int nowPage = 1;// 현재 보고있는 페이지
        //mysql
        int sno = (nPage - 1) * recordPerPage;
        int eno = recordPerPage;


        Map map = new HashMap();
        map.put("sno", sno);
        map.put("eno", eno);
        map.put("listno", listno);

        model.addAllAttributes(map);
//        System.out.println("map="+map);
        List<ReviewDTO> list = rservice.list(map);

//        System.out.println("list="+list);
        model.addAttribute("list", list);


        request.setAttribute("list", list);


        return "/list/read";
    }


    @GetMapping("/list/create")
    public String create() {

        return "/list/create";
    }

    @PostMapping("/list/create")
    public String create(ListDTO dto) {

        System.out.println("dto=" + dto);
        if (service.create(dto) == 1) {
            return "redirect:/user/contents/list";
        } else {
            return "error";
        }
    }

    @RequestMapping("/list")
    public String list(HttpServletRequest request) {
        // 검색관련------------------------
        String col = Utility.checkNull(request.getParameter("col"));
        String word = Utility.checkNull(request.getParameter("word"));

        if (col.equals("total")) {
            word = "";
        }

        // 페이지관련-----------------------
        int nowPage = 1;// 현재 보고있는 페이지
        if (request.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }
        int recordPerPage = 15;// 한페이지당 보여줄 레코드갯수

        // DB에서 가져올 순번-----------------
        int sno = ((nowPage - 1) * recordPerPage);
        int eno = nowPage * recordPerPage;

        Map map = new HashMap();
        map.put("col", col);
        map.put("word", word);
        map.put("sno", sno);
        map.put("cnt", recordPerPage);


//        System.out.println("map="+map);

        int total = service.total(map);

        List<ListDTO> list = service.list(map);

        String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

        // request에 Model사용 결과 담는다
        request.setAttribute("list", list);
        request.setAttribute("nowPage", nowPage);
        request.setAttribute("col", col);
        request.setAttribute("word", word);
        request.setAttribute("paging", paging);

        // view페이지 리턴
        return "/list";

    }


}
