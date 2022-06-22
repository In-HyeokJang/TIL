package com.study.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.notice.NoticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {

  @Autowired
  private NoticeMapper mapper;

  @Override
  public int create(NoticeDTO dto) {
    // TODO Auto-generated method stub
    return mapper.create(dto);
  }

  @Override
  public List<NoticeDTO> list(Map map) {
    // TODO Auto-generated method stub
    return mapper.list(map);
  }

  @Override
  public int total(Map map) {
    // TODO Auto-generated method stub
    return mapper.total(map);
  }

  @Override
  public NoticeDTO read(int noticeno) {
    // TODO Auto-generated method stub
    return mapper.read(noticeno);
  }

  @Override
  public int passwd(Map map) {
    // TODO Auto-generated method stub
    return mapper.passwd(map);
  }

  @Override
  public int update(NoticeDTO noticeDTO) {
    // TODO Auto-generated method stub
    return mapper.update(noticeDTO);
  }

  @Override
  public int delete(int noticeno) {
    // TODO Auto-generated method stub
    return mapper.delete(noticeno);
  }

  @Override
  public void upCnt(int noticeno) {
    // TODO Auto-generated method stub
    mapper.upCnt(noticeno);
  }
  
  
}
