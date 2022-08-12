package com.rentcar.support.controller;

import com.rentcar.support.model.Request;
import com.rentcar.support.model.Supporter;
import com.rentcar.support.service.RequestServiceImpl;
import com.rentcar.support.service.SupportServiceImpl;
import com.rentcar.utility.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
    지원 차량 정보 저장 및 관리
 */

@RestController
@RequestMapping("/admin")
public class SupporterRestController {

    @Autowired
    private SupportServiceImpl supportService;


    // 서포터 등록
    @PostMapping("/support/create_supporter")
    public Boolean create_supporter(@RequestBody Map map){

        Boolean answer = supportService.create(map);
        return answer;
    }


    @PostMapping("/support/update")
    public Boolean update(@RequestBody Supporter surpport){

        return supportService.update(surpport);
    }

    @GetMapping("/support/delete/{carnum}")
    public Boolean delete(@PathVariable("carnum") String carnum) throws UnsupportedEncodingException {
        String supporter = URLDecoder.decode(carnum,"utf-8");
        Boolean flag = supportService.delete(supporter);
        return flag;
    }


}
