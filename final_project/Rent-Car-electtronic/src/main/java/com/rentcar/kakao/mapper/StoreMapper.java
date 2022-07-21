package com.rentcar.kakao.mapper;

import com.rentcar.kakao.Model.Store;

import java.util.List;

public interface StoreMapper {

    List<Store> stores(String lat,String lng);
}
