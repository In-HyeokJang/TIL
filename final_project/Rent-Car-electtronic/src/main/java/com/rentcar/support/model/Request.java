package com.rentcar.support.model;

import com.rentcar.login.model.LoginDTO;
import lombok.Data;


/*

도움 요청 정보 객체 Table X
 */
@Data
public class Request {

    /*
     견인 및 이동식 충전 서비스 지원
     */
    private String carnum;
    private String reason;

    /*
    요청 좌표(rx,ry)
     */
    private String rx;
    private String ry;
    private String state;

    private String supporter_carnum;
}
