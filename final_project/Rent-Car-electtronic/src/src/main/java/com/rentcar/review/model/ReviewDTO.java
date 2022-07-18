
package com.rentcar.review.model;


import lombok.Data;

@Data
public class ReviewDTO {
    private int rnum;
    private String content;
    private String regdate;
    private String id;
    private int listno;
}
