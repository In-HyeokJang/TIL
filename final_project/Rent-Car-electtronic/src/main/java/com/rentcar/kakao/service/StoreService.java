package com.rentcar.kakao.service;

import com.rentcar.kakao.Model.Store;
import com.rentcar.kakao.Model.StoreDTO;

import java.util.List;
import java.util.Map;

public interface StoreService {


    List<Store> stores(Map<String, String> map);

    Boolean create(Store store);
}
