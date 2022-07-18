package com.rentcar.member.service;


import com.rentcar.member.model.CarConditionDTO;
import com.rentcar.member.model.CarInfo1DTO;
import com.rentcar.member.model.MemberDTO;
import com.rentcar.member.mapper.MemberMapper;



import com.rentcar.member.mapper.MemberMapper;
import com.rentcar.member.model.CarConditionDTO;
import com.rentcar.member.model.CarInfo1DTO;
import com.rentcar.member.model.MemberDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.rentcar.member.service.MemberServiceImpl")
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper mapper;


    @Override
    public MemberDTO mypage(String id) {
        return mapper.mypage(id);
    }

    @Override
    public String reservation(String id) {
        return mapper.reservation(id);
    }

    @Override
    public CarInfo1DTO reservation1(String id) {
        return mapper.reservation1(id);
    }

    @Override
    public CarConditionDTO reservation2(String id) {
        return mapper.reservation2(id);
    }
}
