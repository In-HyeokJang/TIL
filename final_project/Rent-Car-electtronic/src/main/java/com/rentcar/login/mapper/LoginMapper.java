package com.rentcar.login.mapper;

import com.rentcar.login.model.LoginDTO;

import java.util.List;
import java.util.Map;

public interface LoginMapper {

  int loginCheck(Map<String, String> map);
  
  Map getGrade(String id);

  int create(LoginDTO dto);

  int duplicatedId(String id);
  
  int duplicatedEmail(String email);

  String idFind(Map<String, String> map);

  String pwFind(Map<String, String> map);

  LoginDTO read(String id);

  int update(LoginDTO dto);

  void delete(LoginDTO dto);

  int total(Map map);

  List<LoginDTO> list(Map map);
}

