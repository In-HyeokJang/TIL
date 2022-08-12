package com.rentcar.notice.mapper;

import com.rentcar.notice.model.NoticeDTO;

import java.util.List;
import java.util.Map;

public interface NoticeMapper {

  NoticeDTO read(int noticeno);
  
  int total(Map map);
  
  List<NoticeDTO> list(Map map);

  int create(NoticeDTO dto);

  int delete(int noticeno);

  int passwd(Map map);

  int update(NoticeDTO dto);

  int deleteFile(int noticeno);

  List<NoticeDTO> mainNoticeList();
}
