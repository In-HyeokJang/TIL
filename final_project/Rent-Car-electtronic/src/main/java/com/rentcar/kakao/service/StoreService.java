package com.rentcar.kakao.service;

import com.rentcar.kakao.Model.Store;

import java.util.List;

public interface StoreService {


    List<Store> stores(String lat,String lng);
}
