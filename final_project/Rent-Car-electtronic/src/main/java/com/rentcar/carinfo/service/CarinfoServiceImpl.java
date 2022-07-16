package com.rentcar.carinfo.service;

import com.rentcar.carinfo.model.CarinfoDTO;
import com.rentcar.carinfo.mapper.CarinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("com.rentcar.carinfo.service.CarinfoServiceImpl")
public class CarinfoServiceImpl implements CarinfoService {

    @Autowired
    private CarinfoMapper mapper;


    @Override
    public Boolean create(Map map) {
        return mapper.create(map);
    }

    @Override
    public int total(Map map) {
        return mapper.total(map);
    }

    @Override
    public List<CarinfoDTO> list(Map map) {
        return mapper.list(map);
    }

    @Override
    public CarinfoDTO read(String carnumber) {
        return mapper.read(carnumber);
    }

    @Override
    public int update(CarinfoDTO dto) {
        return mapper.update(dto);
    }

    @Override
    public int delete(String carnumber) {
        return mapper.delete(carnumber);
    }

    @Override
    public int updateFile(Map map) {
        return mapper.updateFile(map);
    }
}

