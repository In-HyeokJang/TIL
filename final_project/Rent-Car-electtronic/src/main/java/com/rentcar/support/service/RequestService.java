package com.rentcar.support.service;

import com.rentcar.support.model.Request;

import java.util.List;
import java.util.Map;

public interface RequestService {


    Request read(String carnum);

    Boolean create(Request request);

    Boolean update(Request request);

    Boolean accept_request(Map<String, String> map, String supporter);

    List<Request> list(Map map);


    Boolean readmock(String carnum);

    Boolean cancle(String carnum);
}
