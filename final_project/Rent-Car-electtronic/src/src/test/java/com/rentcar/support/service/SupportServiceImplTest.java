package com.rentcar.support.service;

import com.rentcar.support.mapper.SupporterMapper;
import com.rentcar.support.model.Supporter;
import com.rentcar.utility.Utility;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class SupportServiceImplTest {

    @Autowired
    private SupporterMapper mapper;

    @Test
    public void support_find(){

        Supporter surpport = new Supporter();

        String carnum = "12가1234";
        surpport.setCarnum(carnum);

        Supporter su =mapper.read(carnum);
        System.out.println(su);
    }

    @Test
    @DisplayName("list 테스트")
    public void list(){

        Map map = new HashMap();
        map.put("col", ""); // select tag
        map.put("word", ""); // 검색어
        map.put("sno", 0); // 현재 페이지 번호
        map.put("cnt", 5); // 페이지당 표시할 글 수

        List<Supporter> list = mapper.list(map);

        System.out.println(list);
    }

}