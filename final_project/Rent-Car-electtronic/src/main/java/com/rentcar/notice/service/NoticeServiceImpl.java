package com.rentcar.notice.service;

import com.rentcar.notice.mapper.NoticeMapper;
import com.rentcar.notice.model.NoticeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("com.rentcar.notice.service.NoticeServiceImpl")
public class NoticeServiceImpl implements NoticeService{

  @Autowired
  private NoticeMapper mapper;
  
  @Override
  public NoticeDTO read(int noticeno) {
    // TODO Auto-generated method stub
    return mapper.read(noticeno);
  }

  @Override
  public int total(Map map) {
    // TODO Auto-generated method stub
    return mapper.total(map);
  }

  @Override
  public List<NoticeDTO> list(Map map) {
    // TODO Auto-generated method stub
    return mapper.list(map);
  }

  @Override
  public int create(NoticeDTO dto) {
    return mapper.create(dto);
  }

  @Override
  public int delete(int noticeno) {
    return mapper.delete(noticeno);
  }

  @Override
  public int passwd(Map map) {
    return mapper.passwd(map);
  }

  @Override
  public int update(NoticeDTO dto) {
    return mapper.update(dto);
  }

  @Override
  public int deleteFile(int noticeno) {
    return mapper.deleteFile(noticeno);
  }

  @Override
  public List<NoticeDTO> mainNoticeList() {
    return mapper.mainNoticeList();
  }


}
