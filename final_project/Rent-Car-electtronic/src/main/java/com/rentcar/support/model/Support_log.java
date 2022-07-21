package com.rentcar.support.model;


import lombok.Builder;
import lombok.Data;

/*
도움 요청에 관한 기록 보관 Table
 */
@Data
@Builder
public class Support_log {

    private String name;

    private String reason;

    private String rx;
    private String ry;

    // 요청 시간
    private String request_time;

    // 수락 시간
    private String accepted_time;

    // 처리완료 시간
    private String complete_time;

    private String carnum;
}
