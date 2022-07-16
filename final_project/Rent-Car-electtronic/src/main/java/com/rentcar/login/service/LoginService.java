package com.rentcar.login.service;

import com.rentcar.login.model.LoginDTO;

import java.util.Map;

public interface LoginService {

  int loginCheck(Map<String, String> map);

  Map getGrade(String id);

  int create(LoginDTO dto);

  int duplicatedId(String id);

  int duplicatedEmail(String email);

  String idFind(Map<String, String> map);

}
