package com.rentcar.support.service;

import com.rentcar.support.model.Support_log;
import com.rentcar.support.model.Supporter;

import java.util.List;
import java.util.Map;

public interface SurpportService {


    Supporter read(String carnum);

    Boolean create(Map map);

    Boolean update(Supporter carnum);

    // 서포터 차량 전제
    List<Supporter> list(Map map);

    // 지원 가능한 차량
    List<Supporter> cansurpport(Map map);

    int total(Map map);

    Boolean delete(String carnum);

    Boolean complete(String carnum);
}
