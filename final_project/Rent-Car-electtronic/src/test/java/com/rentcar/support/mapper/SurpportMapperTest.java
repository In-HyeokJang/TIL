package com.rentcar.support.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SurpportMapperTest {

    @Autowired
    SupporterMapper mapper;

    @Test
    public void test1(){
        String  carnum = "12가1234";
        System.out.println(mapper.read(carnum));
    }

}