package com.rentcar.support.controller;

import com.rentcar.support.model.Request;
import com.rentcar.support.model.Res;
import com.rentcar.support.service.RequestServiceImpl;
import com.rentcar.support.service.SupportServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

/*
request.jsp 로부터 요청에 대한 정보 습득 후 Surpport_log 테이블 저장

고객 help 요청 -> 요청 수락 (서포터 차량 부여 및 상태 변경<accept>) -> 이동중(going) -> 처리완료(done)

 */

@Slf4j
@RestController
@RequestMapping("/user")
public class RequestRestController {

    Logger logger = LoggerFactory.getLogger(RequestRestController.class);

    @Autowired
    private RequestServiceImpl requestService;

    @Autowired
    private SupportServiceImpl surpportService;

    // 요청자의 위치 정보를 습득하여 help_request 테이블에 저장한다.
    @PostMapping("/request/help")
    public Res create(@RequestBody Request request) {
        Res res = new Res();
        // 예약 되어진 차량 check
        if (!requestService.readmock(request.getCarinfo_carnum())) {
            res.setResult("존재하지 않는 차량입니다.");
            return res;
        } else {
            requestService.create(request);
            res.setResult("등록되었습니다.");
        }
        return res;
    }


    // 요청 정보를 관리자가 지원차량 등록 후 수락할 것
    @GetMapping("/request/help/accept")
    public Boolean state(@RequestParam("carnum") String carinfo_carnum,
                         @RequestParam("supporter") String supporter) {
        Map<String, String> map = new HashMap<>();

        map.put("carinfo_carnum", carinfo_carnum);
        map.put("supporter", supporter);
        map.put("state", "accept");

        Boolean flag = requestService.accept_request(map, supporter);

        return flag;
    }

    // 요청 취소
    @GetMapping("/request/help/delete/{carnum}")
    public Boolean delete(@PathVariable("carnum") String carnum) {
        return requestService.cancle(carnum);
    }

    @GetMapping("/request/help/complete/{carnum}")
    public Boolean complete(@PathVariable("carnum") String carnum) throws UnsupportedEncodingException {
        String decodecarnum = URLDecoder.decode(carnum,"utf-8");
        return surpportService.complete(decodecarnum);
    }

}
