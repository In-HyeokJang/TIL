package com.rentcar.review.service;

import java.util.List;
import java.util.Map;

import com.rentcar.review.mapper.ReviewMapper;
import com.rentcar.review.model.ReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.rentcar.review.service.ReviewServiceImpl")
public class ReviewServiceImpl implements ReviewService {
  
  @Autowired
  private ReviewMapper mapper;
  
  @Override
  public int create(ReviewDTO ReviewDTO) {
    // TODO Auto-generated method stub
    return mapper.create(ReviewDTO);
  }

  @Override
  public List<ReviewDTO> list(Map map) {
    // TODO Auto-generated method stub
    return mapper.list(map);
  }

  @Override
  public ReviewDTO read(int rnum) {
    // TODO Auto-generated method stub
    return mapper.read(rnum);
  }

  @Override
  public int update(ReviewDTO ReviewDTO) {
    // TODO Auto-generated method stub
    return mapper.update(ReviewDTO);
  }

  @Override
  public int delete(int rnum) {
    // TODO Auto-generated method stub
    return mapper.delete(rnum);
  }

  @Override
  public int total(int listno) {
    // TODO Auto-generated method stub
    return mapper.total(listno);
  }

  @Override
  public void bdelete(int listno) {
    // TODO Auto-generated method stub
    mapper.bdelete(listno);
  }

  @Override
  public int rcount(int listno) {
    // TODO Auto-generated method stub
    return 0;
  }


}
