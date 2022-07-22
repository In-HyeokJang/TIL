package com.rentcar.kakao.controller;


import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/map")
public class Mapcontroller {


    @GetMapping("/map")
    public String map(){
        return "/map";
    }


    @GetMapping("/facilities/create")
    public String facilities(){
        return "/facilities";
    }
}
