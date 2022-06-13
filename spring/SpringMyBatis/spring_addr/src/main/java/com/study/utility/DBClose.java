package com.study.utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBClose {
  public static void close(Connection con) {
    try {
      if(con !=null) con.close();
     } catch (SQLException e) {
       // TODO Auto-generated catch block
       e.printStackTrace();
     }  
  }
  public static void close(PreparedStatement pstmt, Connection con) {
    try {
      if(pstmt !=null)pstmt.close();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    try {
     if(con !=null) con.close();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }    
  }
  public static void close(ResultSet rs, PreparedStatement pstmt, Connection con) {
    try {
      if(rs !=null)rs.close();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    try {
      if(pstmt !=null)pstmt.close();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    try {
     if(con !=null) con.close();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }

}
