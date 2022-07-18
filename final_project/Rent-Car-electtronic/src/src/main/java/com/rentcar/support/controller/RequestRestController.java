package com.rentcar.support.controller;

import com.rentcar.support.model.Request;
import com.rentcar.support.service.RequestServiceImpl;
import com.rentcar.support.service.SupportServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/*
request.jsp 로부터 요청에 대한 정보 습득 후 Surpport_log 테이블 저장

고객 help 요청 -> 요청 수락 (서포터 차량 부여 및 상태 변경<accept>) -> 이동중(going) -> 처리완료(done)

 */

@Slf4j
@RestController
@RequestMapping("/request")
public class RequestRestController {

    Logger logger = LoggerFactory.getLogger(RequestRestController.class);

    @Autowired
    private RequestServiceImpl requestService;

    @Autowired
    private SupportServiceImpl surpportService;

    // 요청자의 위치 정보를 습득하여 help_request 테이블에 저장한다.
    @PostMapping("/help")
    public Boolean create(@RequestBody Request request) {

        System.out.println(request);
        // 예약 되어진 차량 check
        if (requestService.readmock(request.getCarnum()) == false) {
            return false;
        } else {
            requestService.create(request);
        }
        return true;
    }


    // 요청 정보를 관리자가 지원차량 등록 후 수락할 것
    @GetMapping("/help/accept")
    public Boolean state(@RequestParam("carnum") String carnum,
                         @RequestParam("supporter") String supporter) {
        Map<String, String> map = new HashMap<>();

        map.put("carnum", carnum);
        map.put("supporter", supporter);
        map.put("state", "accept");

        Boolean flag = requestService.accept_request(map, supporter);

        return flag;
    }

    @PostMapping("/help/delete/{carnum}")
    public Boolean delete(@PathVariable("carnum") String carnum) {
        System.out.println(carnum);
        requestService.cancle(carnum);
        return true;
    }


}
