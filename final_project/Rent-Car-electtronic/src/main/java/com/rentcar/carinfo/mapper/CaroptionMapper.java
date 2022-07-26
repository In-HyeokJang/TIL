package com.rentcar.carinfo.mapper;

import com.rentcar.carinfo.model.CaroptionDTO;

public interface CaroptionMapper {

    int create(CaroptionDTO dto);
    int update(CaroptionDTO dto);

}
