package com.rentcar.member.service;


import com.rentcar.member.model.CarConditionDTO;
import com.rentcar.member.model.CarInfo1DTO;
import com.rentcar.member.model.MemberDTO;

//@Service
public interface MemberService {

    MemberDTO mypage(String id);

    String reservation(String id);

    CarInfo1DTO reservation1(String id);

    CarConditionDTO reservation2(String id);
}