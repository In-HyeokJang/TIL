package com.rentcar.login.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rentcar.login.model.LoginDTO;
import com.rentcar.login.service.LoginService;
import com.rentcar.utility.UploadLicense;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rentcar.utility.Utility;


@Controller
public class LoginController {


    @Autowired
    @Qualifier("com.rentcar.login.service.LoginServiceImpl")
    private LoginService service;

    @GetMapping("/")
    public String home() {
        return "/home";
    }

    @GetMapping("/user/idfind")
    public String idfind() {

        return "/user/idfind";
    }


    @PostMapping("/user/create")
    public String create(LoginDTO dto, HttpServletRequest request) throws IOException {
        String upDir = UploadLicense.getUploadDir();
        String fname = Utility.saveFileSpring(dto.getFnameMF(), upDir);
        int size = (int) dto.getFnameMF().getSize();
        if (size > 0) {
            dto.setFname(fname);
        } else {
            return "error";
        }

        if (service.create(dto) > 0) {
            return "redirect:/";
        } else {
            return "error";
        }


    }

    @PostMapping("/user/createForm")
    public String create() {

        return "/user/create";
    }

    @GetMapping("/user/agree")
    public String agree() {

        return "/user/agree";
    }

    @GetMapping("/user/logout")
    public String logout(HttpSession session) {
        session.invalidate();

        return "redirect:/";
    }

    @PostMapping("/user/login")
    public String login_check(@RequestParam Map<String, String> map, HttpSession session,
                        HttpServletRequest request, HttpServletResponse response,
                        Model model) {

        int cnt = service.loginCheck(map);

        if (cnt > 0) {// 회원일경우
            Map gmap = service.getGrade(map.get("id"));
            session.setAttribute("id", map.get("id"));
            session.setAttribute("grade", gmap.get("grade"));
            session.setAttribute("mname", gmap.get("mname"));

            // Cookie 저장, 아이디 저장 체크
            Cookie cookie = null;
            String c_id = request.getParameter("c_id");
            if (c_id != null) {
                cookie = new Cookie("c_id", c_id); // c_id=> Y
                cookie.setMaxAge(60 * 60 * 24 * 365);// 1년
                response.addCookie(cookie);// 요청지(client:브라우저 컴) 쿠키 저장

                cookie = new Cookie("c_id_val", map.get("id"));
                cookie.setMaxAge(60 * 60 * 24 * 365);// 1년
                response.addCookie(cookie);// 요청지(client:브라우저 컴) 쿠키 저장
            } else {
                cookie = new Cookie("c_id", ""); // 쿠키 삭제
                cookie.setMaxAge(0);
                response.addCookie(cookie);

                cookie = new Cookie("c_id_val", "");// 쿠키 삭제
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }


        if (cnt == 0 || cnt < 0) {

            model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");

            return "/login/errorMsg";
        }
        return "redirect:/";
    }


    @GetMapping("/user/login")
    public String login(HttpServletRequest request) {

        //쿠키 설정 시작
        String c_id = ""; // ID 저장 여부를 저장하는 변수, Y
        String c_id_val = ""; // ID 값

        Cookie[] cookies = request.getCookies();
        Cookie cookie = null;

        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];

                if (cookie.getName().equals("c_id")) {
                    c_id = cookie.getValue(); // Y
                } else if (cookie.getName().equals("c_id_val")) {
                    c_id_val = cookie.getValue();
                }
            }
        }
        // 쿠키 설정 끝

        request.setAttribute("c_id", c_id);
        request.setAttribute("c_id_val", c_id_val);

        return "/user/login";
    }

}
