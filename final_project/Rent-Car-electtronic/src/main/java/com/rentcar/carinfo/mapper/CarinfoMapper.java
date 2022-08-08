package com.rentcar.carinfo.mapper;

import com.rentcar.carinfo.model.CarinfoDTO;
import com.rentcar.carinfo.model.CaroptionDTO;


import java.util.List;
import java.util.Map;


public interface CarinfoMapper {

    int create(CarinfoDTO dto);
    int total(Map map);
    List<CarinfoDTO> list(Map map);
    CarinfoDTO read(String carnumber);
    int update(CarinfoDTO dto);
    int delete(String carnumber);
    int updateFile(CarinfoDTO dto);
    int updateFile(Map map);
    int create(CaroptionDTO cdto);
    int mapupdate(CarinfoDTO dto);
}
