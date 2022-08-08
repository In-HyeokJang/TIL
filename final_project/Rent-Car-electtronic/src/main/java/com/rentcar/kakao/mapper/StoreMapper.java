package com.rentcar.kakao.mapper;

import com.rentcar.kakao.Model.Store;

import java.util.List;
import java.util.Map;

public interface StoreMapper {

    List<Store> stores();

    Boolean create(Store store);
}
