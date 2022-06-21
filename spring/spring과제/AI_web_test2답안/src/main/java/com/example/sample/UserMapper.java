package com.example.sample;

import java.util.Map;

public interface UserMapper {

  int loginCheck(Map<String, String> map);

  String getName(String id);

}
