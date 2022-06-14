package com.study.model;

import java.util.List;
import java.util.Map;

public interface AddrMapper {

  List<AddrDTO> list(Map map);
  int total(Map map);
  AddrDTO read(int addressnum);
  int create(AddrDTO dto);
  int update(AddrDTO dto);
  int delete(int addressnum);
 
  

}
