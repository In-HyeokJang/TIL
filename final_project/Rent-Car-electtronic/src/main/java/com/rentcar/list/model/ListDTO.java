package com.rentcar.list.model;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class ListDTO {

        private int    listno     ;
        private String title        ;
        private String content      ;
        private String wname        ;
        private int    cnt          ;
        private int recommend       ;
        private String rdate        ;
        private String data_key     ;
        private MultipartFile multipartFile;
}
