package com.rentcar.support.controller;

import com.rentcar.support.service.SupportServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;
import java.util.Map;


@SpringBootTest
class SurpportControllerTest {

    @Autowired
    private SupportServiceImpl service;
    @Test
    public void list(){
        Map<String, String> map = new HashMap<>();
        String carnum = "12가1234";
        map.put("carnum", carnum);
        System.out.println(service.list(map));
    }
}