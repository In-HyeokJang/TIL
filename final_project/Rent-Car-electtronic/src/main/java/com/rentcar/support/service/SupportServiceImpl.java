package com.rentcar.support.service;


import com.rentcar.support.mapper.RequestMapper;
import com.rentcar.support.mapper.SupporterMapper;
import com.rentcar.support.model.Request;
import com.rentcar.support.model.State;
import com.rentcar.support.model.Support_log;
import com.rentcar.support.model.Supporter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class SupportServiceImpl implements SurpportService {

    @Autowired
    private SupporterMapper mapper;

    @Autowired
    private RequestMapper requestMapper;

    @Override
    public Supporter read(String carnum) {
        return mapper.read(carnum);
    }

    @Override
    public Boolean create(Map map) {
        return mapper.create(MaptoModel(map));
    }

    @Override
    public Boolean update(Supporter surpport) {
        return mapper.update(surpport);
    }

    @Override
    public List<Supporter> list(Map map) {
        return mapper.list(map);
    }

    @Override
    public List<Supporter> cansurpport(Map map) {
        return mapper.cansurpport(map);
    }


    public int total(Map map) {
        return mapper.total(map);
    }

    @Override
    public Boolean delete(String carnum) {
        return mapper.delete(carnum);
    }

    public Supporter MaptoModel(Map map){

        List<String> answer= (List<String>) map.get("answer");
        List<String> selected= (List<String>) map.get("selected");
        //List<String> registe= (List<String>) map.get("registe");

        System.out.println(answer); // ex. [1123123123, 2022-07-04, 1, 1]
        System.out.println(selected); // ex. [1,2,3,4]
        //System.out.println(registe); // ex. ["강서점", "홍길동", "지점 번호", "주소"]

        Supporter supporter = Supporter.builder()
                .carnum(answer.get(0))
                .production(answer.get(1))
                .brand(answer.get(2))
                .model(answer.get(3))

                .dccombo(selected.get(0))
                .dcdemo(selected.get(1))
                .ac(selected.get(2))
                .fullcharge(selected.get(3))
                .state("stay")
                .build();

        return supporter;
    }

    @Override
    public Boolean complete(String carnum) {

        Request request = requestMapper.read(carnum);

        Support_log log = Support_log.builder()
                .name(request.getName())
                .rx(request.getRx())
                .ry(request.getRy())
                .reason(request.getReason())
                .request_time(request.getRequest_time())
                .accepted_time(request.getAccepted_time())
                .carnum(carnum)
                .build();

        // 요청사항 취소
        requestMapper.cancle(carnum);

        // 서포터 상태 stay로 변경
        Supporter supporter = mapper.read(request.getSupporter_carnum());
        supporter.setState("stay");
        mapper.update(supporter);

        return mapper.complete(log);
    }

}

