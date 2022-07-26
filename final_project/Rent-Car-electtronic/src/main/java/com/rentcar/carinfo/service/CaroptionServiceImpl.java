package com.rentcar.carinfo.service;

import com.rentcar.carinfo.mapper.CaroptionMapper;
import com.rentcar.carinfo.model.CaroptionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.rentcar.carinfo.service.CaroptionServiceImpl")
public class CaroptionServiceImpl implements CaroptionService {

    @Autowired
    private CaroptionMapper mapper;


    @Override
    public int create(CaroptionDTO dto) {
        return mapper.create(dto);
    }

    @Override
    public int update(CaroptionDTO dto) {
        return mapper.update(dto);
    }


}

