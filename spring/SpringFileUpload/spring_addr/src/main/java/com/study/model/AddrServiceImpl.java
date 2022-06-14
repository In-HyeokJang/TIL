package com.study.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.model.AddrServiceImpl")
public class AddrServiceImpl implements AddrService {

  @Autowired
  private AddrMapper mapper;

  @Override
  public List<AddrDTO> list(Map map) {
    // TODO Auto-generated method stub
    return mapper.list(map);
  }

  @Override
  public int total(Map map) {
    // TODO Auto-generated method stub
    return mapper.total(map);
  }

  @Override
  public AddrDTO read(int addressnum) {
    // TODO Auto-generated method stub
    return mapper.read(addressnum);
  }

  @Override
  public int create(AddrDTO dto) {
    // TODO Auto-generated method stub
    return mapper.create(dto);
  }

  @Override
  public int update(AddrDTO dto) {
    // TODO Auto-generated method stub
    return mapper.update(dto);
  }

  @Override
  public int delete(int addressnum) {
    // TODO Auto-generated method stub
    return mapper.delete(addressnum);
  }

  
}
