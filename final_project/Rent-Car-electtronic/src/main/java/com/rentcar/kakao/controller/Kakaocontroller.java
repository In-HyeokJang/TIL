package com.rentcar.kakao.controller;


import com.rentcar.kakao.Model.Store;
import com.rentcar.kakao.Model.StoreDTO;
import com.rentcar.kakao.service.Kakaoservice;
import com.rentcar.kakao.service.StoreServiceImpl;
import net.minidev.json.JSONArray;
import net.minidev.json.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

@RestController
public class Kakaocontroller {

    @Value("${kakao.url}")
    private String url;

    @Autowired
    private Kakaoservice kakaoservice;

    @Autowired
    private StoreServiceImpl storeService;

    @GetMapping("/kakao_url/{lat}/{lng}")
    public JSONArray kakao_charge(@PathVariable("lat") String lat, @PathVariable("lng") String lng) throws IOException, ParseException {
        /*
        lat( x 좌표 ) lng( y 좌표 ) 가 카카오에서는 두 값을 바꾸어 입력해야 정상값이 도출된다.
         */
        StringBuilder urlBuilder = new StringBuilder(url); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("page", "UTF-8") + "=" + 1);
        urlBuilder.append("&" + URLEncoder.encode("sort", "UTF-8") + "=" + "accuracy");
        urlBuilder.append("&" + URLEncoder.encode("query", "UTF-8") + "=" + URLEncoder.encode("전기차충전소", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("x", "UTF-8") + "=" + lng);
        urlBuilder.append("&" + URLEncoder.encode("y", "UTF-8") + "=" + lat);
        urlBuilder.append("&" + URLEncoder.encode("radius", "UTF-8") + "=" + 2000); // 1km
        urlBuilder.append("&" + URLEncoder.encode("size", "UTF-8") + "=" + 15); // 0< x < 15


        return kakaoservice.getMap(urlBuilder);
    }


    // todo: 사용자의 위치 중심으로 주변 편의시설 검색
    @GetMapping("/facilities/{lat}/{lng}")
    public List<Store> facilities(@PathVariable("lat") String lat,
                                  @PathVariable("lng") String lng){

        return storeService.stores(lat,lng);
    }

    @PostMapping("/facilities/create")
    public Boolean create_facilities(@RequestBody Store store){

        return storeService.create(store);
    }
}
