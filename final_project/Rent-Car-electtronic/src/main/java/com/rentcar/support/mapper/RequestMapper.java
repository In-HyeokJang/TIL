package com.rentcar.support.mapper;


import com.rentcar.support.model.Request;
import com.rentcar.support.model.Support_log;
import com.rentcar.support.model.Supporter;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/*
support_log 테이블로 저장
 */
@Repository
public interface RequestMapper {

    Request read(String carnum);

    // 도움 요청
    Boolean create(Request request);

    Boolean update(Request request);

    List<Request> list(Map map);

    Boolean accept_request(Map<String, String> map);

//     예약된 차량 check
    Boolean readmock(String carnum);

    Boolean cancle(String carnum);

}
