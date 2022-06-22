package com.study.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {
  int create(ReviewDTO reviewDTO);
  
  List<ReviewDTO> list(Map map);
  
  ReviewDTO read(int rnum);
  
  int update(ReviewDTO reviewDTO);
  
  int delete(int rnum);
  
  int total(int contentsno);
}
