package com.study.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.study.model.AddrDTO;
import com.study.model.AddrService;
import com.study.utility.Utility;

@Controller
public class AddrController {

  @Autowired
  @Qualifier("com.study.model.AddrServiceImpl")
  private AddrService dao;
  
  @GetMapping
  public String home() {
    
    return "/home";
  }
  
  @GetMapping("/addr/list")
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


    List<AddrDTO> list = dao.list(map);
    int total = dao.total(map);
    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
    
    //2. request 저장
    
    request.setAttribute("list",list);
    request.setAttribute("paging",paging);
    request.setAttribute("col",col);
    request.setAttribute("word",word);
    request.setAttribute("nowPage",nowPage);
    
    return "/list";
  }
  
  @GetMapping("/addr/create")
  public String create() {
    
    return "/create";
  }
  
  @PostMapping("/addr/create")
  public String create(AddrDTO dto) {
    
    int flag = dao.create(dto);
    if(flag!=1) {
      return "error";
    }else {
      return "redirect:list";
    }
  }//end create
  
  @GetMapping("/addr/read/{addressnum}")
  public String read(@PathVariable int addressnum, Model model) {
   
    model.addAttribute("dto",dao.read(addressnum));
    
    return "/read";
  }
  @GetMapping("/addr/update/{addressnum}")
  public String update(@PathVariable int addressnum, Model model) {
    
    model.addAttribute("dto",dao.read(addressnum));
    
    return "/update";
  }
  @PostMapping("/addr/update")
  public String update(AddrDTO dto) {
    int flag = dao.update(dto);
    if(flag != 1) {
      return "error";
    }else {
      return "redirect:list";
    }
  }
  
  @GetMapping("/addr/delete/{addressnum}")
  public String delete(@PathVariable int addressnum) {
    
    int flag = dao.delete(addressnum);  
    
    if(flag!=1) return "error";
    else   return "redirect:/addr/list";
    
  }
  

  
}  
