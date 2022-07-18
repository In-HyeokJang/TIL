package com.rentcar.login.mapper;

import com.rentcar.login.model.LoginDTO;

import java.util.Map;

public interface LoginMapper {

  int loginCheck(Map<String, String> map);
  
  Map getGrade(String id);

  int create(LoginDTO dto);

  int duplicatedId(String id);
  
  int duplicatedEmail(String email);

  String idFind(Map<String, String> map);

}
