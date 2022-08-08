package com.rentcar.login.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class LoginDTO {
  private String id;
  private String passwd;
  private String mname;
  private String phone;
  private String email;
  private String license;
  private String jumin;
  private String grade;
  private String point;
  private String fname;
  private String zipcode;
  private String address1;
  private String address2;
  private String mdate;
}
