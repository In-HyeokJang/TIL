package com.study.model;
 
public class ReplyDTO {
  private int rnum;
  private String content;
  private String regdate;
  private String id;
  private int bbsno;
 
  public int getRnum() {
    return rnum;
  }
 
  public void setRnum(int rnum) {
    this.rnum = rnum;
  }
 
  public String getContent() {
    return content;
  }
 
  public void setContent(String content) {
    this.content = content;
  }
 
  public String getRegdate() {
    return regdate;
  }
 
  public void setRegdate(String regdate) {
    this.regdate = regdate;
  }
 
  public String getId() {
    return id;
  }
 
  public void setId(String id) {
    this.id = id;
  }
 
  public int getBbsno() {
    return bbsno;
  }
 
  public void setBbsno(int bbsno) {
    this.bbsno = bbsno;
  }
}