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
        private String rdate        ;

}
