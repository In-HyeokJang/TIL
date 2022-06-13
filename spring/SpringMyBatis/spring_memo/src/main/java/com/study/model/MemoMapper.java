package com.study.model;

import java.util.List;
import java.util.Map;

public interface MemoMapper {

  List<MemoDTO> list(Map map);

  int total(Map map);

  int create(MemoDTO dto);

  void upViewcnt(int memono);

  MemoDTO read(int memono);

  int passCheck(Map map);

  int update(MemoDTO dto);

  int delete(int memono);

  MemoDTO readReply(int memono);

  void upAnsnum(Map map);

  int createReply(MemoDTO dto);

}
