package com.rentcar.utility;
import java.io.File;
 
public class UploadCon {
    /** 페이지당 출력할 레코드 갯수 */
    public static int RECORD_PER_PAGE = 3;
 
    // Windows, VMWare, AWS cloud 절대 경로 설정
    // 공통 필요
    public static synchronized String getUploadDir() {
        String path = "";
        if (File.separator.equals("\\")) {
            path = "C:/Aistudy_JIH/deploy/carinfo/storage/";
            System.out.println("Windows 10: " + path);
            
        } else {
            // System.out.println("Linux");
            path = "/root/deploy/carinfo/storage/";
        }
        
        return path;
    }
    
}