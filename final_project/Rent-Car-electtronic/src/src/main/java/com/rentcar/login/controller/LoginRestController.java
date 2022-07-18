package com.rentcar.login.controller;

import com.rentcar.login.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class LoginRestController {

    @Autowired
    @Qualifier("com.rentcar.login.service.LoginServiceImpl")
    private LoginService service;


    @GetMapping("/user/idfindex")
    public String idfind(@RequestParam Map<String, String> map) {

        String id = service.idFind(map);

        if (id != null && !id.equals("")) {
            return "찾으시는 아이디는 " + id + " 입니다.";
        } else {
            return "찾으시는 아이디는 존재하지 않습니다.";
        }

    }


    @GetMapping(value = "/user/emailcheck", produces = "application/json;charset=utf-8")
    public Map<String, String> emailcheck(String email) {
        int cnt = service.duplicatedEmail(email);

        Map<String, String> map = new HashMap<String, String>();
        if (cnt > 0) {
            map.put("str", email + "는 이미 사용 중인 이메일 입니다.");
        } else {
            map.put("str", email + "는 사용 가능한 이메일 입니다.");
        }
        return map;
    }


    @GetMapping(value = "/user/idcheck", produces = "application/json;charset=utf-8")
    public Map<String, String> idcheck(String id) {
        int cnt = service.duplicatedId(id);

        Map<String, String> map = new HashMap<String, String>();
        if (cnt > 0) {
            map.put("str", id + "는 이미 사용 중인 아이디입니다.");
        } else {
            map.put("str", id + "는 사용 가능한 아이디 입니다.");
        }
        return map;
    }

}
