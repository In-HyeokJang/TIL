package com.rentcar.carinfo.model;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
public class CarinfoDTO {

    private String carnumber ; //차번호판
    private String carname ; 	// 차이름
    private String carimage ; 	// 차사진
    private MultipartFile filenameMF;
    private int rentcost; // 가격
    private String carseate; //좌석수
    private String carpoint ;  	// 차 위치 (지점)
    private String category ; // 차 종류
    private String caryearmodel ;  // 차연식
    private CaroptionDTO cdto ;
    private int rentstatus;
    private String x;
    private String y;
}



