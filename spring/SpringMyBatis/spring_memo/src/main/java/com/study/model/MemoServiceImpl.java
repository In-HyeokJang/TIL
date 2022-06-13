package com.study.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.model.MemoServiceImpl")
public class MemoServiceImpl implements MemoService {

  @Autowired
  private MemoMapper mapper;

  @Override
  public List<MemoDTO> list(Map map) {
    // TODO Auto-generated method stub
    return mapper.list(map);
  }

  @Override
  public int total(Map map) {
    // TODO Auto-generated method stub
    return mapper.total(map);
  }

  @Override
  public int create(MemoDTO dto) {
    // TODO Auto-generated method stub
    return mapper.create(dto);
  }

  @Override
  public void upViewcnt(int memono) {
    // TODO Auto-generated method stub
    mapper.upViewcnt(memono);
  }

  @Override
  public MemoDTO read(int memono) {
    // TODO Auto-generated method stub
    return mapper.read(memono);
  }

  @Override
  public int passCheck(Map map) {
    // TODO Auto-generated method stub
    return mapper.passCheck(map);
  }

  @Override
  public int update(MemoDTO dto) {
    // TODO Auto-generated method stub
    return mapper.update(dto);
  }

  @Override
  public int delete(int memono) {
    // TODO Auto-generated method stub
    return mapper.delete(memono);
  }

  @Override
  public MemoDTO readReply(int memono) {
    // TODO Auto-generated method stub
    return mapper.readReply(memono);
  }

  @Override
  public void upAnsnum(Map map) {
    // TODO Auto-generated method stub
    mapper.upAnsnum(map);
  }

  @Override
  public int createReply(MemoDTO dto) {
    // TODO Auto-generated method stub
    return mapper.createReply(dto);
  }
}
