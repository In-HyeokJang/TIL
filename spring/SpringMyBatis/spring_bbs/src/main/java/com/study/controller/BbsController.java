package com.study.controller;
 
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.model.BbsDTO;
import com.study.model.BbsService;
import com.study.utility.Utility;
 
// ComponentScan 할떄 IoC 될수있도록 어노테이션을 지정해준다.
@Controller
public class BbsController {
  
  @Autowired
  @Qualifier("com.study.model.BbsServiceImpl") //SeviceImlp에서 입력한걸 가져옴
  private BbsService dao;
  
  @PostMapping("/bbs/reply")
  public String reply(BbsDTO dto) {
    Map map = new HashMap();
    map.put("grpno", dto.getGrpno());
    map.put("ansnum", dto.getAnsnum());
    dao.upAnsnum(map);
    
    if(dao.createReply(dto) == 1) {
      return "redirect:list";
    }else {
      return "error";
    }
  }
  
  @GetMapping("/bbs/reply/{bbsno}")
  public String reply(@PathVariable int bbsno, Model model) {
    
    model.addAttribute("dto",dao.readReply(bbsno));
    
    return "/reply";
  }
  
  @PostMapping("/bbs/delete")
  public String delete(int bbsno, String passwd) {
    Map map = new HashMap();
    map.put("bbsno", bbsno);
    map.put("passwd", passwd);
    
    int pflag = dao.passCheck(map);
    int flag = 0;
    if(pflag == 1)flag = dao.delete(bbsno);
    
    if(pflag!=1)return "passwdError"; //비밀번호 오류일때 비밀오류 페이지를 보여준다.
    else if(flag!=1)return "error";
    else return "redirect:list";
  }
  
  @GetMapping("/bbs/delete/{bbsno}")
  public String delete(@PathVariable int bbsno, Model model) {
    model.addAttribute("bbsno", bbsno);
    return "/delete";
  }
  
  @GetMapping("/bbs/update/{bbsno}")
  public String update(@PathVariable int bbsno, Model model) {
    model.addAttribute("dto",dao.read(bbsno));
    return "/update";
  }
  
  @PostMapping("/bbs/update")
  public String update(BbsDTO dto) {
    Map map = new HashMap();
    map.put("bbsno", dto.getBbsno());
    map.put("passwd", dto.getPasswd());
    int pflag = dao.passCheck(map);
    int flag = 0;
    
    if(pflag == 1) flag = dao.update(dto);
    
    if(pflag!= 1) return "passwdError";
    else if(flag!=1) return "error";
    else {
      return "redirect:list";
    }
  }
  
  @GetMapping("/")
  public String home(Locale locale, Model model) {
    Date date = new Date();
    DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
    
    String formattedDate = dateFormat.format(date);
    
    model.addAttribute("serverTime", formattedDate );
    return "/home";
  }
  
  @GetMapping("/bbs/list")
  public String list(HttpServletRequest request) {
    String col = Utility.checkNull(request.getParameter("col"));
    String word = Utility.checkNull(request.getParameter("word"));

    if (col.equals("total")) {
      word = "";
    }
    // 페이징 관련---
    int nowPage = 1;
    if (request.getParameter("nowPage") != null) {
      nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }

    int recordPerPage = 5;

    int sno = ((nowPage - 1) * recordPerPage);
    int eno = recordPerPage;

    Map map = new HashMap();
    map.put("col", col);
    map.put("word", word);
    map.put("sno", sno);
    map.put("eno", eno);


    List<BbsDTO> list = dao.list(map);
    int total = dao.total(map);
    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
    
    //2. request 저장 (view페이지에서 사용할 내용을 저장)
    
    request.setAttribute("list",list);
    request.setAttribute("paging",paging);
    request.setAttribute("col",col);
    request.setAttribute("word",word);
    request.setAttribute("nowPage",nowPage);
    
    return "/list";
  }
  
  @GetMapping("/bbs/create")
  public String create() {
    
    
    return "/create";
  }
  @PostMapping("/bbs/create")
  public String create(BbsDTO dto) {
    
    int cnt = dao.create(dto);
    if(cnt!=1) return "error";
      return "redirect:list";
  }
  @GetMapping("bbs/read/{bbsno}")
  public String read(@PathVariable int bbsno ,Model model) {
    dao.upViewcnt(bbsno);
    model.addAttribute("dto",dao.read(bbsno));
    
    return "/read";
  }
  
}
