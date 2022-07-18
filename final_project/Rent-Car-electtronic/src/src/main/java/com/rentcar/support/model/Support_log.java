package com.rentcar.support.model;


import lombok.Data;

/*
도움 요청에 관한 기록 보관 Table
 */
@Data
public class Support_log {

    private int no;

    private String name;
    // 요청 시간
    private String request;

    // 수락 시간
    private String accept;

    // 처리완료 시간
    private String processed;
}
