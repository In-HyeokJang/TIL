package com.rentcar.kakao.Model;


import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Store {
    private String name;
    private String address;
    private String address_road;
    private String phonenum;
    private String type;
    private String x;
    private String y;
}
