package com.rentcar.list.controller;

import com.rentcar.list.model.ListDTO;
import com.rentcar.list.service.ListServiceImpl;
import com.rentcar.review.model.ReviewDTO;
import com.rentcar.review.service.ReviewServiceImpl;
import com.rentcar.utility.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/contents")
public class ListController {

    @Autowired
    private ListServiceImpl service;

    @Autowired
    private ReviewServiceImpl rservice;



    @GetMapping("/list/delete")
    public String delete(int listno, Model model) {
        model.addAttribute("listno", listno);
        return "/list/delete";
    }

    @PostMapping("/list/delete")
    public String delete(int listno) {

        Map map = new HashMap();
        map.put("listno", listno);
        System.out.println(map);


        service.delete(listno);

        return "redirect:/contents/list";


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
        int recordPerPage = 3;

        //oracle
        //int sno = ((nPage - 1) * recordPerPage) + 1;
        //int eno = nPage * recordPerPage;

        //mysql
        int sno = (nPage - 1) * recordPerPage;
        int eno = recordPerPage;

        Map map = new HashMap();
        map.put("sno", sno);
        map.put("eno", eno);
        map.put("nPage", nPage);

        model.addAllAttributes(map);

        ReviewDTO rlist = (ReviewDTO) rservice.list(map);


        return "/list/read";
    }


    @GetMapping("/list/create")
    public String create() {

        return "/list/create";
    }

    @PostMapping("/list/create")
    public String create(ListDTO dto) {

        if (service.create(dto) == 1) {
            return "redirect:/contents/list";
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
        int recordPerPage = 3;// 한페이지당 보여줄 레코드갯수

        // DB에서 가져올 순번-----------------
        int sno = ((nowPage - 1) * recordPerPage);
        // int eno = nowPage * recordPerPage;

        Map map = new HashMap();
        map.put("col", col);
        map.put("word", word);
        map.put("sno", sno);
        map.put("cnt", recordPerPage);

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
