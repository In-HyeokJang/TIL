package com.study.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.model.MemoDAO;
import com.study.model.MemoDTO;
import com.study.utility.Utility;


@Controller
public class MemoController {


    @Autowired
    private MemoDAO dao;
    
    @GetMapping("/")
    public String home(Locale locale, Model model) {
      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
      
      String formattedDate = dateFormat.format(date);
      
      model.addAttribute("serverTime", formattedDate );
      return "/home";
    }
    
    @GetMapping("/memo/list")
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


      List<MemoDTO> list = dao.list(map);
      int total = dao.total(map);
      String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
      
      //2. request 저장
      
      request.setAttribute("list",list);
      request.setAttribute("paging",paging);
      request.setAttribute("col",col);
      request.setAttribute("word",word);
      request.setAttribute("nowPage",nowPage);
      return  "/list";
    }
  
    
    // top.jsp에서 memo/create를 컨트롤러가 맵핑된걸 보고 view지정
    //return 된게 tiles에 application.properties두군데를 찾아보고 
    // tiles로 설정하면 /create로 들어간다 
    @GetMapping("/memo/create")
    public String create() {
      return "/create";
      // Get방식으로 url (/memo/create) 받아와서 create메소드 생성하고 다시 /create로 리턴해준다 
      // 그래서 tiles.xml로 가고 거기서value값이 createForm.jsp니까 그걸 받고 Form으로 이동 후 post로 움직인다?
    }
    
    @PostMapping("memo/create") 
    // 그래서 여기서 post로 받고 생성한 Form을 확인 후? 메소드 생성후 
    // dto에 있는걸 dao.create로 받고 flag에 넣어주고 
    // 만약 맞으면 list로 되고 아니면 error 코드 발생
    // 그리고 Memo dao create로 가서 데이터베이스에 저장
    
    public String create(MemoDTO dto) {
      
      boolean flag = dao.create(dto);
      if(flag) {
        return "redirect:list";
      }else {
        return "error";
      }
    }
    
    @GetMapping("/memo/read/{memono}")
    public String read(@PathVariable int memono, Model model) {
      dao.upViewcnt(memono);
      model.addAttribute("dto", dao.read(memono));
      
      return "/read";
    }

    @GetMapping("/memo/update/{memono}")
    public String update(@PathVariable int memono, Model model) {
      model.addAttribute("dto", dao.read(memono));
      return "/update";
    }
    
    @PostMapping("/memo/update")
    public String update(MemoDTO dto) {
      
      Map<String,String> map = new HashMap<String,String>();
      map.put("memono", String.valueOf(dto.getMemono()));
      map.put("passwd", dto.getPasswd());
      
      boolean pflag = dao.passCheck(map);
      boolean flag = false;
      
      if(pflag)flag = dao.update(dto);
      
      if(!pflag) return "passwdError";
      else if(!flag) return "error";
      else return "redirect:list";
      
    }
    @GetMapping("/memo/delete/{memono}")
    public String delete(@PathVariable int memono, Model model) {
      model.addAttribute("memono", memono);
      return "/delete";
    }
    @PostMapping("/memo/delete")
    public String delete(@RequestParam Map<String, String> map) {
      int memono = Integer.parseInt(map.get("memono"));
      boolean pflag = dao.passCheck(map);
      boolean flag = false;
      
      if(pflag) flag = dao.delete(memono);
      
      if(!pflag) return "passwdError";
      else if(!flag) return "error";
      else return "redirect:list";
    }
    @GetMapping("/memo/reply/{memono}")
    public String reply(@PathVariable int memono, Model model) {
      model.addAttribute("dto", dao.readReply(memono));
      
      return "/reply";
    }
    
    @PostMapping("/memo/reply")
    public String reply(MemoDTO dto) {
      Map map = new HashMap();
      map.put("grpno", dto.getGrpno());
      map.put("ansnum", dto.getAnsnum());
      dao.upAnsnum(map);
      
      if(dao.createReply(dto)) {
        return "redirect:list";
      }else {
        return "error";
      }      
    }
}
