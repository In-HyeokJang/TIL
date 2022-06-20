package com.example.sample;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.example.sample.UserServiceImpl")
public class UserServiceImpl implements UserService {

  @Autowired
  private UserMapper mapper;

  @Override
  public int loginCheck(Map map) {
    // TODO Auto-generated method stub
    return mapper.loginCheck(map);
  }

  @Override
  public UserDTO read(String id) {
    // TODO Auto-generated method stub
    return mapper.read(id);
  }
  

}
