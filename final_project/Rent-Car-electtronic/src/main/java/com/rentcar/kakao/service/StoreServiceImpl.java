package com.rentcar.kakao.service;

import com.rentcar.kakao.Model.Store;
import com.rentcar.kakao.Model.StoreDTO;
import com.rentcar.kakao.mapper.StoreMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class StoreServiceImpl implements StoreService {


    @Autowired
    private StoreMapper storeMapper;

    // TODO: 사용자 기준 2km 이내의 편의 시설 을 계산하려면 만하탄 알고리즘을 사용해야할까?
    public List<Store> stores(Map<String, String> map) {
        List<Store> list = storeMapper.stores();

        Timer timer = new Timer();

        long s = timer.start();
        Stream<Store> stream = list.stream();

        List<Store> answer = stream.parallel().filter(data ->
                        HV(Double.parseDouble(data.getX()), Double.parseDouble(data.getY()),
                                Double.parseDouble(map.get("lng")), Double.parseDouble(map.get("lat"))) <= 0.3)
                .collect(Collectors.toList());

        long e = timer.end();
        timer.showtime(s,e);
        return answer;
    }

    @Override
    public Boolean create(Store store) {
        return storeMapper.create(store);
    }


    public double HV(double lat, double lng, double now_lat, double now_lng) {
        double radians = (Math.PI / 108);

        /*
        ( 6371 * acos(cos( radians(36.6165832729277) ) *
        cos( radians(y)) * cos(radians(x) - radians(127.475797)) + sin(radians(36.6165832729277)) * sin(radians(y))))
         */
        double answer = (6371 * Math.acos(Math.cos(radians * (now_lat)) *
                Math.cos(radians * lat) * Math.cos(radians * lng - radians * (now_lng)) + Math.sin(radians * (now_lat)) * Math.sin(radians * (lat))));

        return answer;
    }
}
