package com.example.sample;


public class UserDTO {
  
  private String id     ; 
  private String passwd ; 
  private String name   ;
  
  public UserDTO() {
    super();
    // TODO Auto-generated constructor stub
  }
  
  @Override
  public String toString() {
    return "UserDTO [id=" + id + ", passwd=" + passwd + ", name=" + name + "]";
  }
  
  public UserDTO(String id, String passwd, String name) {
    super();
    this.id = id;
    this.passwd = passwd;
    this.name = name;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPasswd() {
    return passwd;
  }

  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  } 
         
  
  
}
