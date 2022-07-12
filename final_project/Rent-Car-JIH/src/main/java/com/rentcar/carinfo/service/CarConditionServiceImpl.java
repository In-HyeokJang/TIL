package com.rentcar.carinfo.service;

import com.rentcar.carinfo.mapper.CarConditionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.rentcar.carinfo.service.CarConditionServiceImpl")
public class CarConditionServiceImpl implements CarConditionService{

    @Autowired
    CarConditionMapper mapper;
}
