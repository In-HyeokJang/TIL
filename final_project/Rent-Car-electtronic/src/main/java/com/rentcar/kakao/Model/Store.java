package com.rentcar.kakao.Model;


import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Store {
    private String store_name;
    private String address;
    private String phone;
    private String x;
    private String y;
    private String accumulate_point;
    private String category;
}
