package com.example.sample;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
  @Autowired
  private UserMapper mapper;

  public int loginCheck(Map<String, String> map) {
    // TODO Auto-generated method stub
    return mapper.loginCheck(map);
  }

  public String getName(String id) {

    return mapper.getName(id);
    
  }
}
