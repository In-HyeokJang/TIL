package com.rentcar.notice.controller;

import com.rentcar.notice.model.NoticeDTO;
import com.rentcar.notice.service.NoticeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rentcar.utility.Utility;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class NoticeController {
    @Autowired
    @Qualifier("com.rentcar.notice.service.NoticeServiceImpl")
    private NoticeService service;

    private static final Logger log = LoggerFactory.getLogger(NoticeController.class);

    @GetMapping
    public String home() {

        return "/home";
    }

    @PostMapping("/notice/delete")
    public String delete(HttpServletRequest request, int noticeno, String passwd) {

        Map map = new HashMap();
        map.put("noticeno", noticeno);
        map.put("passwd", passwd);
        int pcnt = service.passwd(map);

        log.info("passwd :" , pcnt);

        int cnt = 0;
        if (pcnt==1) {

            cnt = service.delete(noticeno);
        }

        if (pcnt != 1) {
            return "passwdError";
        } else if (cnt==1) {
            return "redirect:./list";
        } else {
            return "error";
        }

    }

    @GetMapping("/notice/delete")
    public String delete(int noticeno) {
        return "/notice/delete";
    }

    @GetMapping("/notice/create")
    public String create() {

        return "/notice/create";
    }

    @PostMapping("/notice/create")
    public String create(NoticeDTO dto) {
        if(service.create(dto)==1) {
            return "redirect:list";
        }else {
            return"error";
        }

    }

    @GetMapping("/notice/read")
    public String read(int noticeno,Model model) {
            
      NoticeDTO dto = service.read(noticeno);
      
      String content = dto.getContent().replaceAll("\r\n", "<br>");
      
      dto.setContent(content);
      
      model.addAttribute("dto",dto);
      
      return "/notice/read";
    }
    
    @RequestMapping("/notice/list")
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
        int sno = ((nowPage - 1) * recordPerPage) ;
        //sql limit: 0부터 시작, 가져올 갯수 ===> sno,cnt
        //nowPage 는 1부터 시작됨

        // int eno = nowPage * recordPerPage;

        Map map = new HashMap();
        map.put("col", col);
        map.put("word", word);
        map.put("sno", sno);
        map.put("cnt", recordPerPage);
     
        int total = service.total(map);
     
        List<NoticeDTO> list = service.list(map);


        String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
     
        // request에 Model사용 결과 담는다
        request.setAttribute("list", list);
        request.setAttribute("nowPage", nowPage);
        request.setAttribute("col", col);
        request.setAttribute("word", word);
        request.setAttribute("paging", paging);
     
        // view페이지 리턴
        return "/notice/list";
        
    }

}
