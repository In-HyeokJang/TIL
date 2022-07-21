package com.rentcar.support.mapper;


import com.rentcar.support.model.Support_log;
import com.rentcar.support.model.Supporter;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface SupporterMapper {

    Supporter read(String carnum);

    Boolean create(Supporter supporter);

    Boolean update(Supporter surpport);

    // 서포터 차량 전제
    List<Supporter> list(Map map);

    // 지원 가능한 차량
    List<Supporter> cansurpport(Map map);

    int total(Map map);

    Boolean delete(String carnum);

    Boolean complete(Support_log log);
}
