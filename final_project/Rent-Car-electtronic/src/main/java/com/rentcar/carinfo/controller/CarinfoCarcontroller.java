package com.rentcar.carinfo.controller;


import com.rentcar.utility.Ncloud.service.AwsS3Service;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.rentcar.carinfo.model.CarinfoDTO;
import com.rentcar.carinfo.service.CarinfoService;
import com.rentcar.utility.Utility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
//@RequestMapping("/carinfo")
@RequiredArgsConstructor
public class CarinfoCarcontroller {


    private static final Logger log = LoggerFactory.getLogger(CarinfoCarcontroller.class);

    @Autowired
    @Qualifier("com.rentcar.carinfo.service.CarinfoServiceImpl")
    private CarinfoService service;
    private final AwsS3Service awsS3Service;

    @GetMapping("/admin/carinfo/optupdate/{carnumber}")
    public String update(@PathVariable("carnumber") String carnumber){
        return "/carinfo/optupdate";
    }
    @GetMapping("/admin/carinfo/mapupdate/{carnumber}")
    public String mapupdate(@PathVariable ("carnumber") String carnumber) {
        return "/carinfo/mapupdate";
    }

    @PostMapping("/carinfo/mapupdate")
    public String mapupdate(CarinfoDTO dto) {
        int cnt = service.mapupdate(dto);
        if(cnt == 1){
            return "null";
        }else{
            return "error";
        }
    }


    @PostMapping("/carinfo/updateFile")
    public String updateFile(MultipartFile filenameMF, CarinfoDTO dto, HttpServletRequest request
    ) throws IOException {

        int cnt = service.updateFile(dto);
        if (cnt == 1) {
            return "redirect:/carinfo/list";
        } else {
            return "error";
        }
    }

    @GetMapping("/admin/carinfo/updateFile/{carnumber}")
    public String updateFileForm(@PathVariable("carnumber") String carnumber, Model model) {
        CarinfoDTO dto = service.read(carnumber);
        model.addAttribute("dto", dto);
        return "/carinfo/updateFile";
    }


    @GetMapping("/carinfo/delete/{carnumber}")
    public String delete(@PathVariable String carnumber) {
        int flag = service.delete(carnumber);
        if (flag != 1) return "error";
        else return "redirect:/carinfo/list";
    }

    @PostMapping("/carinfo/update")
    public String update(CarinfoDTO dto) {
        int cnt = service.update(dto);
        if (cnt == 1) {
            return "redirect:/carinfo/list";
        } else {
            return "error";
        }
    }

    @GetMapping("/admin/carinfo/update/{carnumber}")
    public String update(@PathVariable("carnumber") String carnumber, Model model) {

        CarinfoDTO dto = service.read(carnumber);
        model.addAttribute("dto", dto);
        return "/carinfo/update";
    }

    @GetMapping("/user/carinfo/read/{carnumber}")
    public String read(@PathVariable("carnumber") String carnumber, Model model) {
        CarinfoDTO dto = service.read(carnumber);
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!");
        log.info("read dto: " + dto);
        System.out.println(dto);
        model.addAttribute("dto", dto);
        return "/carinfo/read";
    }


    @PostMapping("/carinfo/create")
    public String create(CarinfoDTO dto, HttpServletRequest request
    ) throws IOException {

        if (service.create(dto) > 0) {
            return "/carinfo/optcreate";
        } else {
            return "error";
        }

    }

    @GetMapping("/admin/carinfo/create")
    public String create() {return
                "/carinfo/create";
    }


    // /user/carinfo/list  --> /carinfo/list

    @RequestMapping("/carinfo/list")
    public String list(HttpServletRequest request) {
        // 검색관련------------------------
        String col = Utility.checkNull(request.getParameter("col"));
        String word = Utility.checkNull(request.getParameter("word"));

        if (col.equals("total")) {
            word = "";
        }
        int nowPage = 1;
        if (request.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }
        int recordPerPage = 3;
        int sno = (nowPage - 1) * recordPerPage;
        int eno = recordPerPage;

        Map map = new HashMap();
        map.put("col", col);
        map.put("word", word);
        map.put("sno", sno);
        map.put("eno", eno);

        int total = service.total(map);
        List<CarinfoDTO> list = service.list(map);
        String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

        request.setAttribute("list", list);
        request.setAttribute("nowPage", nowPage);
        request.setAttribute("col", col);
        request.setAttribute("word", word);
        request.setAttribute("paging", paging);

        return "/carinfo/list";
    }
}