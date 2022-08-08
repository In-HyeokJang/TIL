package com.rentcar.list.mapper;


import com.rentcar.list.model.ListDTO;
import org.springframework.http.ResponseEntity;

import java.util.List;
import java.util.Map;

public interface ListMapper {
    int create(ListDTO dto);
    List<ListDTO> list(Map map);
    int total(Map map);
    void upCnt(int listno);
    ListDTO read(int listno);
    int passwd(Map map);
    int update(ListDTO dto);
    int delete(int listno);

    int recommend(int listno);
}
