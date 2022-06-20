package com.example.sample;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class UserController {
  private static final Logger log = LoggerFactory.getLogger(UserController.class);
  
  @Autowired
  @Qualifier("com.example.sample.UserServiceImpl")
  private UserService service;
  
  @GetMapping("/")
  public String loginCheck() {
    
    return "test1";
  }
  
  
  
  @GetMapping("/login/{id}/{passwd}")
  public ResponseEntity<UserDTO> get(@PathVariable("id") String id, @PathVariable("passwd") String passwd) {
 
    Map map = new HashMap();
    map.put("id", id);
    map.put("passwd", passwd);
    
    int cnt = service.loginCheck(map);
    if(cnt == 1) {
      return new ResponseEntity<UserDTO>(service.read(id), HttpStatus.OK);}
    else {
      return null;
    }
  
    }
      
}
