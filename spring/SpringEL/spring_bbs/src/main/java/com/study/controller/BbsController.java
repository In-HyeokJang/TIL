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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.bbs.UploadBbs;
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
    
    String upDir = UploadBbs.getUploadDir();
    if(dto.getFilenameMF().getSize() > 0) {
      dto.setFilename(Utility.saveFileSpring(dto.getFilenameMF(), upDir));
      dto.setFilesize((int)dto.getFilenameMF().getSize());
    }
    
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
  public String delete(int bbsno, String passwd, String oldfile) {
    Map map = new HashMap();
    map.put("bbsno", bbsno);
    map.put("passwd", passwd);
    
    String upDri = UploadBbs.getUploadDir(); //upDir은 경로
    
    int pflag = dao.passCheck(map);
    int flag = 0;
    if(pflag == 1) {
      flag = dao.delete(bbsno); // 이거는 db에서 지우는거
      if(oldfile != null) Utility.deleteFile(upDri, oldfile); // 서버의 스토리지 안에서 지우겠다
    }

    
    
    if(pflag!=1)return "passwdError"; //비밀번호 오류일때 비밀오류 페이지를 보여준다.
    else if(flag!=1)return "error";
    else return "redirect:list";
  }
  
  @GetMapping("/bbs/delete/{bbsno}")
  public String delete(@PathVariable int bbsno, 
       String oldfile, Model model) {
    
    int cnt = dao.checkRefnum(bbsno); // bbsno의 refnum의 번호를 확인해서 cnt에 넣는다.
    boolean flag = false;
    if(cnt>0) flag =true;
    
    model.addAttribute("bbsno", bbsno);
    model.addAttribute("oldfile", oldfile);
    model.addAttribute("flag", flag);
    return "/delete";
  }
  
  @GetMapping("/bbs/update/{bbsno}")
  public String update(@PathVariable int bbsno, Model model) {
    model.addAttribute("dto",dao.read(bbsno));
    return "/update";
  }
  
  @PostMapping("/bbs/update")
  public String update(BbsDTO dto, String oldfile) {
    String upDir = UploadBbs.getUploadDir();
    if(dto.getFilenameMF().getSize() > 0) {
      if(oldfile != null) Utility.deleteFile(upDir, oldfile); //oldfile이 null이 아니면 삭제하겠다
      dto.setFilename(Utility.saveFileSpring(dto.getFilenameMF(), upDir)); // 저장하는 코드
      dto.setFilesize((int)dto.getFilenameMF().getSize()); // 사이즈 저장 코드
    }
    
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
    
    String upDir = UploadBbs.getUploadDir();
    
    if(dto.getFilenameMF().getSize() > 0) {//브라우져에서 파일을 보냈다.
      dto.setFilename(Utility.saveFileSpring(dto.getFilenameMF(), upDir));
      dto.setFilesize((int)dto.getFilenameMF().getSize());
    }
    
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
  
  @PostMapping(value = "/bbs/delete_Ajax", produces = "application/json;charset=UTF-8")
  @ResponseBody
  public Map<String, String> delete_Ajax(@RequestBody BbsDTO dto, HttpServletRequest request) {
          boolean cflag = false;
          int cnt = dao.checkRefnum(dto.getBbsno());
          if (cnt > 0)
                  cflag = true;
          String upDir = UploadBbs.getUploadDir();
          Map map = new HashMap();
          map.put("bbsno", dto.getBbsno());
          map.put("passwd", dto.getPasswd());

          boolean pflag = false;
          boolean flag = false;

          if (!cflag) {
                  int cnt2 = dao.passCheck(map);
                  if (cnt2 > 0)
                          pflag = true;
          }
          if (pflag) {
                  if (dto.getFilename() != null)
                          Utility.deleteFile(upDir, dto.getFilename());
                  int cnt3 = dao.delete(dto.getBbsno());
                  if (cnt3 > 0)
                          flag = true;
          }

          Map<String, String> map2 = new HashMap<String, String>();

          if (cflag) {
                  map2.put("str", "답변있는 글이므로 삭제할 수 없습니다");
                  map2.put("color", "blue");
          } else if (!pflag) {
                  map2.put("str", "패스워드가 잘못입력되었습니다");
                  map2.put("color", "blue");
          } else if (flag) {
                  map2.put("str", "삭제 처리되었습니다");
                  map2.put("color", "blue");
          } else {
                  map2.put("str", "삭제중 에러가 발생했습니다");
                  map2.put("color", "blue");
          }

          return map2;
  }

  @GetMapping("/bbs/delete_Ajax")
  public String delete_Ajax() {

          return "/bbs/delete_Ajax";
  }
  
}
