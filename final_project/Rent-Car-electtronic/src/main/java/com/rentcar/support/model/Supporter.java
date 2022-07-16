package com.rentcar.support.model;

import lombok.Builder;
import lombok.Data;


/*
서포트 차량 테이블
 */
@Data
@Builder
public class Supporter {

    private String carnum;
    private String registed;
    private String production;

    private String brand;
    private String model;

    private String dccombo;
    private String dcdemo;
    private String ac;
    private String fullcharge;

    private String state;

}
