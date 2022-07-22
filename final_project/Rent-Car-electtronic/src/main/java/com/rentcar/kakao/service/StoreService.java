package com.rentcar.kakao.service;

import com.rentcar.kakao.Model.Store;
import com.rentcar.kakao.Model.StoreDTO;

import java.util.List;

public interface StoreService {


    List<Store> stores(String lat,String lng);

    Boolean create(Store store);
}
