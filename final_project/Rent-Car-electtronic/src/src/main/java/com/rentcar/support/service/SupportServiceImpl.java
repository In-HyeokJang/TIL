package com.rentcar.support.service;


import com.rentcar.support.mapper.SupporterMapper;
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

}

//class answer{
//    private String
//}
