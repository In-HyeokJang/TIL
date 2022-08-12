package com.rentcar.kakao.service;

import com.rentcar.kakao.Model.Store;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;


class StoreServiceImplTest {

    @Test
    public void stream() {
        List<Store> list = new ArrayList<>();
        Store store = Store.builder()
                .name("봄봄")
                .address("충북 청주시 서원구 수곡동 1002")
                .address_road("충청북도 청주시 서원구 수곡로 34")
                .phonenum("123-1234-1234")
                .x("127.474194791881") //lng
                .y("36.6153023118373") //lat
                .build();

        list.add(store);
        Stream<Store> stream = list.stream();

        stream.filter(data -> HV(Double.parseDouble(data.getX()), Double.parseDouble(data.getY()), 36.6153023118373, 127.474194791881) <= 0.3)
                .forEach(System.out::println);
    }

    public double HV(double lng, double lat, double now_lat, double now_lng) {

        double radians = (Math.PI / 108);
        double answer = (6371 * Math.acos(Math.cos(radians * (now_lng)) *
                Math.cos(radians * lng) * Math.cos(radians * lat - radians * (now_lat)) + Math.sin(radians * (now_lng)) * Math.sin(radians * (lng))));
        System.out.println(answer);
        return answer;
    }
}