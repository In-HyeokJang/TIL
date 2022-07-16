package com.rentcar.member.mapper;


import com.rentcar.member.model.CarConditionDTO;
import com.rentcar.member.model.CarInfo1DTO;
import com.rentcar.member.model.MemberDTO;
import org.springframework.stereotype.Repository;


public interface MemberMapper {
    MemberDTO mypage(String id);

    String reservation(String id);

    CarInfo1DTO reservation1(String id);

    CarConditionDTO reservation2(String id);
}
