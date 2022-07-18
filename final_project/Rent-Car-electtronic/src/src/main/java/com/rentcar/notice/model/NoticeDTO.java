package com.rentcar.notice.model;

import lombok.Data;

@Data
public class NoticeDTO {
    private int    noticeno     ;
    private String title        ;
    private String content      ;
    private String wname        ;
    private String passwd       ;
    private String wdate        ;
    private String fname        ;

}
