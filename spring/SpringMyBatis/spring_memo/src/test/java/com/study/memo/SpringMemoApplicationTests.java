package com.study.memo;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class SpringMemoApplicationTests {

  
  @Autowired
  private SqlSessionTemplate sqlSession;
  @Test
  void contextLoads() {
  }
  
  @Test
  public void testSqlSession() throws Exception{
    System.out.println(sqlSession.toString());
 }

}
