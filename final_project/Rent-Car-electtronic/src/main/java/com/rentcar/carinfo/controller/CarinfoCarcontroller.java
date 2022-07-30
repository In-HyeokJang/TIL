package com.rentcar.carinfo.controller;


import com.rentcar.utility.Ncloud.AwsS3;
import com.rentcar.utility.Ncloud.service.AwsS3Service;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import com.rentcar.carinfo.model.CarinfoDTO;

import com.rentcar.carinfo.service.CarinfoService;

import com.rentcar.utility.UploadCon;
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
@RequestMapping("/carinfo")
@RequiredArgsConstructor
public class CarinfoCarcontroller {


    private static final Logger log = LoggerFactory.getLogger(CarinfoCarcontroller.class);
    @Autowired
    @Qualifier("com.rentcar.carinfo.service.CarinfoServiceImpl")
    private CarinfoService service;
    private final AwsS3Service awsS3Service;

//    @PostMapping("/resource")
//    public AwsS3 upload(@RequestPart("file")
//                        MultipartFile multipartFile) throws IOException {
//
//        return awsS3Service.upload(multipartFile,"carinfo");
//        // 나는 db에 키 값을 저장하고 싶어
//
//    }

    @PostMapping("/updateFile")
    public String updateFile(MultipartFile filenameMF, String oldfile, String carnumber)throws IOException{

        String basePath = UploadCon.getUploadDir();
        if(oldfile != null && !oldfile.equals("default.jpg")){
            Utility.deleteFile(basePath, oldfile);
        }

        Map map = new HashMap();
        map.put("carnumber", carnumber);
        map.put("carimage", Utility.saveFileSpring(filenameMF, basePath));

        int cnt = service.updateFile(map);
        if(cnt == 1){
            return "redirect:/carinfo/list";
        }else {
            return "error";
        }
    }

    @GetMapping("/updateFile/{carnumber}/{oldfile}")
    public String updateFileForm(@PathVariable("carnumber") String carnumber,
                                 @PathVariable("oldfile") String oldfile,
                                 Model model){
        model.addAttribute("carnumber", carnumber);
        model.addAttribute("oldfile", oldfile);
        return "/carinfo/updateFile";
    }


    @GetMapping("/delete/{carnumber}")
    public String delete(@PathVariable String carnumber){
        int flag = service.delete(carnumber);
        if(flag != 1) return "error";
        else return "redirect:/carinfo/list";
    }

    @PostMapping("/update")
    public String update(CarinfoDTO dto){
        log.info("dto:"+dto);
        int cnt = service.update(dto);
        log.info("cnt:"+cnt);
        if(cnt == 1){
            return "redirect:/carinfo/list";
        }else{
            return "error";
        }
    }
    @GetMapping("/update/{carnumber}")
    public String update(@PathVariable("carnumber") String carnumber, Model model){
        CarinfoDTO dto = service.read(carnumber);
        model.addAttribute("dto", dto);
        return "/carinfo/update";
    }

    @GetMapping("/read/{carnumber}")
    public String read(@PathVariable("carnumber") String carnumber,Model model){
        CarinfoDTO dto = service.read(carnumber);

        log.info("read dto: " + dto);
        model.addAttribute("dto", dto);
        return "/carinfo/read";
    }


    @PostMapping("/create")
    public String create( CarinfoDTO dto, HttpServletRequest request
                         )throws IOException{

        System.out.println(dto);
        log.info("dto: "+ dto);
//        String upDir = UploadCon.getUploadDir();
//        String fname = Utility.saveFileSpring(dto.getFilenameMF(), upDir);
//        int size = (int)dto.getFilenameMF().getSize();
//
//        if(size > 0){
//            dto.setCarimage(fname);
//        }else{
//            dto.setCarimage("default.jpg");
//        }

        if(service.create(dto) > 0 ){
            return "/carinfo/optcreate";
        }else{
            return "error";
        }

    }
    @GetMapping("/create")
    public String create(){
        return
                "/carinfo/create";
    }

//    @PostMapping("/resource")
//    public AwsS3 upload(@RequestPart("filenameMF")
//                        MultipartFile multipartFile) throws IOException {
//        AwsS3 a3 = awsS3Service.upload(multipartFile,"carinfo");
//        System.out.println(a3);
//        System.out.println(a3.getPath());
//        System.out.println(a3.getKey());
//
//        return null;
//
//    }

    @RequestMapping("/list")
    public String list(HttpServletRequest request){
        // 검색관련------------------------
        String col = Utility.checkNull(request.getParameter("col"));
        String word = Utility.checkNull(request.getParameter("word"));

        if (col.equals("total")) {
            word = "";
        }
        int nowPage = 1;
        if(request.getParameter("nowPage") !=null){
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }
        int recordPerPage = 3;
        int sno = (nowPage - 1) * recordPerPage;
        int eno = recordPerPage;

        Map map = new HashMap();
        map.put("col", col);
        map.put("word", word);
        map.put("sno", sno);
        map.put("eno",eno);

        int total = service.total(map);
        List<CarinfoDTO> list = service.list(map);
        String paging = Utility.paging(total, nowPage, recordPerPage,col, word);

        request.setAttribute("list", list);
        request.setAttribute("nowPage", nowPage);
        request.setAttribute("col", col);
        request.setAttribute("word", word);
        request.setAttribute("paging", paging);

        return "/carinfo/list";
    }

}
