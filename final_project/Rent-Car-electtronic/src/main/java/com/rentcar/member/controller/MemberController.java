package com.rentcar.member.controller;

import com.rentcar.member.model.CarConditionDTO;
import com.rentcar.member.model.CarInfo1DTO;
import com.rentcar.member.model.MemberDTO;
import com.rentcar.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/member")
public class MemberController {

    @Autowired
    @Qualifier("com.rentcar.member.service.MemberServiceImpl")
    private MemberService service;

    @GetMapping("/reservation")
    public String reservation(HttpSession session, Model model){

        String id = "user1";
        if (id == null) {
            return "redirect:/user/member/login/";
        } else {
            MemberDTO dto = service.mypage(id);
            System.out.println("dto :::"+dto);
            String dto0 = service.reservation(id);
            System.out.println("dto0 :::"+dto0);
            CarInfo1DTO dto1 = service.reservation1(dto0);
            System.out.println("dto1 :::"+dto1);
            CarConditionDTO dto2 = service.reservation2(dto0);
            System.out.println("dto2 :::"+dto2);

            model.addAttribute("dto", dto);
            model.addAttribute("dto0", dto0);
            model.addAttribute("dto1", dto1);
            model.addAttribute("dto2", dto2);
        }


        return "/reservation";
    }


    @GetMapping("/mypage")
    public String mypage(HttpSession session, Model model){
        String id = (String) session.getAttribute("id");
        System.out.println("@@@@@@@@@@@@@@@@@@"+id);
        if (id == null) {
            return "redirect:/user/login";
        } else {
            MemberDTO dto = service.mypage(id);

            model.addAttribute("dto", dto);
        }


        return "/mypage";
    }


}
