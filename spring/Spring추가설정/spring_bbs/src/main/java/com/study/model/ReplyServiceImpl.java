package com.study.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.model.ReplyServiceImpl")
public class ReplyServiceImpl implements ReplyService {

  @Autowired
  private ReplyMapper mapper;
  
  @Override
  public int create(ReplyDTO replyDTO) {
    // TODO Auto-generated method stub
    return mapper.create(replyDTO);
  }

  @Override
  public List<ReplyDTO> list(Map map) {
    // TODO Auto-generated method stub
    return mapper.list(map);
  }

  @Override
  public ReplyDTO read(int rnum) {
    // TODO Auto-generated method stub
    return mapper.read(rnum);
  }

  @Override
  public int update(ReplyDTO replyDTO) {
    // TODO Auto-generated method stub
    return mapper.update(replyDTO);
  }

  @Override
  public int delete(int rnum) {
    // TODO Auto-generated method stub
    return mapper.delete(rnum);
  }

  @Override
  public int total(int bbsno) {
    // TODO Auto-generated method stub
    return mapper.total(bbsno);
  }

}
