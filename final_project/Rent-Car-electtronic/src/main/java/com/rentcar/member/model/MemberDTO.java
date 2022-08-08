package com.rentcar.member.model;

import lombok.Data;

@Data
public class MemberDTO {

    private String id;
    private String passwd;
    private String mname;
    private String phone;
    private String email;
    private String license;
    private String carnumber;

    private CarInfo1DTO carIndto;
    private CarConditionDTO carCdto;

}