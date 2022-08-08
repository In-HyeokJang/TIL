package com.rentcar.kakao.Model;


import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class StoreDTO {
    private String name;
    private String address_road;
    private String distance;
    private String x;
    private String y;
}
