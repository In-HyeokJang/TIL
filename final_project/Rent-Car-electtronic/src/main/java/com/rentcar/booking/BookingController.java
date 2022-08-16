package com.rentcar.booking;

import com.rentcar.carinfo.model.CarinfoDTO;
import com.rentcar.utility.Utility;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class BookingController {

    private static final Logger log = LoggerFactory.getLogger(BookingController.class);

    @Autowired
    @Qualifier("com.rentcar.booking.BookingServiceImpl")
    private BookingService service;

    @PostMapping("/booking/create")
    public String create(BookingDTO dto, HttpServletRequest request) throws IOException {
        if (service.create(dto) > 0) {
            return "redirect:./";
        } else {
            return "error";
        }
    }

    @GetMapping("/booking/rent")
    public String rent() {
        return "/booking/rent";
    }

    @GetMapping("/booking/detail/{carnumber}")
    public String detail(@PathVariable("carnumber") String carnumber, HttpServletRequest request) {
        Map map = new HashMap();
        map.put("carnumber", carnumber);

        List<CarinfoDTO> search = service.search(map);

        // request에 Model사용 결과 담는다
        request.setAttribute("list", search);
        request.setAttribute("carnumber", carnumber);

        return "/booking/detail";
    }
/*
    @PostMapping("/booking/search")
    public String search(BookingDTO dto, HttpServletRequest request) throws IOException {
        if (service.create(dto) > 0) {
            return "redirect:./create";
        } else {
            return "error";
        }
    }
*/

    @GetMapping("/booking/search/{category}")
    public String search2(@PathVariable("category") int category, HttpServletRequest request) {
        Map map = new HashMap();
        map.put("category", category);

        List<CarinfoDTO> searchList = service.searchList(map);

        // request에 Model사용 결과 담는다
        request.setAttribute("list", searchList);
        request.setAttribute("category", category);

        return "/booking/search";
    }

    @GetMapping("/booking/searchList/{category}")
    public String searchList(@PathVariable("category") int category, HttpServletRequest request) {

        Map map = new HashMap();
        map.put("category", category);

        List<CarinfoDTO> searchList = service.searchList(map);

        // request에 Model사용 결과 담는다
        request.setAttribute("list", searchList);
        request.setAttribute("category", category);

        return "/booking/searchList";
    }

    @RequestMapping("/booking/list")
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
        int recordPerPage = 10;// 한페이지당 보여줄 레코드갯수

        // (oracle) DB에서 가져올 순번-----------------
        // int sno = ((nowPage - 1) * recordPerPage) + 1;
        // int eno = nowPage * recordPerPage;

        // (mysql) DB에서 가져올 순번-----------------
        int sno = (nowPage - 1) * recordPerPage;
        int eno = recordPerPage;

        Map map = new HashMap();
        map.put("col", col);
        map.put("word", word);
        map.put("sno", sno);
        map.put("eno", eno);

        int total = service.total(map);

        List<BookingDTO> list = service.list(map);

        String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

        // request에 Model사용 결과 담는다
        request.setAttribute("list", list);
        request.setAttribute("nowPage", nowPage);
        request.setAttribute("col", col);
        request.setAttribute("word", word);
        request.setAttribute("paging", paging);

        return "/booking/list";

    }

    @GetMapping("/booking/read/{user_id}")
    public String read(@PathVariable("user_id") int booking_no, Model model) {
        model.addAttribute("dto", service.read(booking_no));
        return "/booking/read";
    }

    @GetMapping("/booking/main")
    public String search() {
        return "/booking/main";
    }
}