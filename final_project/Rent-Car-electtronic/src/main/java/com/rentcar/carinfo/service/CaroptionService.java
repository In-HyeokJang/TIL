package com.rentcar.carinfo.service;

import com.rentcar.carinfo.model.CaroptionDTO;

public interface CaroptionService {

    int create(CaroptionDTO dto);

    int update(CaroptionDTO dto);

}
