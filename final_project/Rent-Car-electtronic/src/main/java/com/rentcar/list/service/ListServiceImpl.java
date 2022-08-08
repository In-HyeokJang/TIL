package com.rentcar.list.service;


import com.rentcar.list.mapper.ListMapper;
import com.rentcar.list.model.ListDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("com.rentcar.list.service.ListServiceImpl")
public class ListServiceImpl implements ListService {
  
  @Autowired
  private ListMapper mapper;

  @Override
  public int create(ListDTO dto) {
    // TODO Auto-generated method stub
    return mapper.create(dto);
  }

  @Override
  public List<ListDTO> list(Map map) {
    // TODO Auto-generated method stub
    return mapper.list(map);
  }

  @Override
  public int total(Map map) {
    // TODO Auto-generated method stub
    return mapper.total(map);
  }

  @Override
  public void upCnt(int listno) {
    
    mapper.upCnt(listno);
    
  }

  @Override
  public ListDTO read(int listno) {
    // TODO Auto-generated method stub
    return mapper.read(listno);
  }

  @Override
  public int passwd(Map map) {
    // TODO Auto-generated method stub
    return mapper.passwd(map);
  }

  @Override
  public int update(ListDTO dto) {
    // TODO Auto-generated method stub
    return mapper.update(dto);
  }

  @Override
  public int delete(int listno) {
    // TODO Auto-generated method stub
    return mapper.delete(listno);
  }

  public int recommend(int listno) {


    return mapper.recommend(listno);
  }
}
