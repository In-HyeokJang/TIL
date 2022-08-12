package com.rentcar.review.mapper;
 
import com.rentcar.review.model.ReviewDTO;

import java.util.List;
import java.util.Map;
 
public interface ReviewMapper {

   int create(ReviewDTO ReviewDTO);

   List<ReviewDTO> list(Map map);

   ReviewDTO read(int rnum);

   int update(ReviewDTO ReviewDTO);

   int delete(int rnum);

   int total(int listno);

   void bdelete(int listno);

   int rcount(int listno);


}