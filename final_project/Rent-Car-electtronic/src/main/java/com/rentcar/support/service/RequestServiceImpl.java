package com.rentcar.support.service;


import com.rentcar.support.mapper.RequestMapper;
import com.rentcar.support.mapper.SupporterMapper;
import com.rentcar.support.model.Request;
import com.rentcar.support.model.Support_log;
import com.rentcar.support.model.Supporter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class RequestServiceImpl implements RequestService {

    @Autowired
    private RequestMapper requestMapper;

    @Autowired
    private SupporterMapper supporterMapper;

    /*
    request => 요청중
    accept => 헬퍼 준비중
    on going => 이동중
    done => 처리 완료
     */
    @Override
    public Request read(String carnum) {
        return requestMapper.read(carnum);
    }

    @Override
    public Boolean create(Request request) {
        // TODO: 요정정보 저장 및 상태 정보 저장
        return requestMapper.create(request);
    }

    @Override
    public Boolean update(Request request) {
        return requestMapper.update(request);
    }

    @Override
    public List<Request> list(Map map) {
        return requestMapper.list(map);
    }


    //TODO: 실시간으로 상태를 업데이트 해줘야한다.
    @Override
    public Boolean accept_request(Map<String, String> map, String carnum) {
        // 지원 차량 정보 습득
        Supporter supporter = supporterMapper.read(carnum);
        supporter.setState("going");

        Boolean r1 = supporterMapper.update(supporter);
        Boolean r2 = requestMapper.accept_request(map);

        if(r1 == true && r2 == true){
            return true;
        }else{
            return false;
        }
    }



//    예약 상태에 있는 차량 check
    @Override
    public Boolean readmock(String carnum) {
        return requestMapper.readmock(carnum);
    }

    @Override
    public Boolean cancle(String carnum) {
        return requestMapper.cancle(carnum);
    }



}
