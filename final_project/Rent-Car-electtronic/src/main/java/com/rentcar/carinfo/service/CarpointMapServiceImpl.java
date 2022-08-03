package com.rentcar.carinfo.service;

import com.rentcar.carinfo.mapper.CarpointMapMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.rentcar.carinfo.service.CarpointMapServiceImpl")
public class CarpointMapServiceImpl implements CarpointMapService{

    @Autowired
    private CarpointMapMapper mapper;
}
