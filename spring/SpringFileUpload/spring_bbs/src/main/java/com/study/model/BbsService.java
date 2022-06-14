package com.study.model;

import java.util.List;
import java.util.Map;

public interface BbsService {

  List<BbsDTO> list (Map map);
  int total(Map map);
  void upViewcnt(int bbsno);
  BbsDTO read(int bbsno);
  int create(BbsDTO dto);
  int passCheck(Map map);
  int update(BbsDTO dto);
  int delete(int bbsno);
  BbsDTO readReply(int bbsno);
  void upAnsnum(Map map);
  int createReply(BbsDTO dto);
  int checkRefnum(int bbsno);
}
