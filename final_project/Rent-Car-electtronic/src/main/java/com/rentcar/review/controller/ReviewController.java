package com.rentcar.review.controller;


import com.rentcar.list.service.ListServiceImpl;
import com.rentcar.review.model.ReviewDTO;
import com.rentcar.review.service.ReviewServiceImpl;

import com.rentcar.utility.Utility;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
public class ReviewController {
    private static final Logger log = LoggerFactory.getLogger(ReviewController.class);

    @Autowired
    private ReviewServiceImpl service;
    @Autowired
    private ListServiceImpl rservice;

    @GetMapping("/review/list/{listno}/{sno}/{eno}")
    public ResponseEntity<List<ReviewDTO>> getList(
            @PathVariable("listno") int listno,
            @PathVariable("sno") int sno,
            @PathVariable("eno") int eno) {
        log.info("listno: " + listno);
        Map map = new HashMap();
        map.put("sno", sno);
        map.put("eno", eno);
        map.put("listno", listno);

        System.out.println("map:  " + map);

        return new ResponseEntity<List<ReviewDTO>>(service.list(map), HttpStatus.OK);
    }


    @GetMapping("/review/page")
    public ResponseEntity<String> getPage(int nPage, int listno, int nowPage, String col, String word) {

        System.out.println("listno:  " + listno);
        int total = service.total(listno);
        String url = "read";

        int recordPerPage = 10; // 한페이지당 출력할 레코드 갯수

        String paging = Utility.rpaging(total, nowPage, recordPerPage, col, word, url, nPage);

        return new ResponseEntity<>(paging, HttpStatus.OK);

    }

    @PostMapping("/review/create")
    public ResponseEntity<String> create(@RequestBody ReviewDTO vo) {

        log.info("ReviewDTO:contents " + vo.getContent());
        log.info("ReviewDTO:id " + vo.getId());
        log.info("ReviewDTO:listno " + vo.getListno());
        System.out.println("vo:  " + vo);
        // vo.setContent(vo.getContent().replaceAll("/n/r", "<br>"));

        int flag = service.create(vo);



        return flag == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @GetMapping("/review/{rnum}")
    public ResponseEntity<ReviewDTO> get(@PathVariable("rnum") int rnum) {

        log.info("get: " + rnum);

        return new ResponseEntity<>(service.read(rnum), HttpStatus.OK);
    }

    @PutMapping("/review/")
    public ResponseEntity<String> modify(@RequestBody ReviewDTO vo) {

        log.info("modify: " + vo);

        return service.update(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

    }

    @DeleteMapping("/review/{rnum}")
    public ResponseEntity<String> remove(@PathVariable("rnum") int rnum) {
        System.out.println("rnum="+rnum);
        log.info("remove: " + rnum);

        return service.delete(rnum) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

    }

    @PostMapping("/list/{listno}")
    public ResponseEntity<String> recommend(@PathVariable("listno") int listno) {
        System.out.println("listno="+listno);
        log.info("listno: " + listno);

        int flag = rservice.recommend(listno);

        System.out.println("flag?="+flag);

        return flag == 1 ?  new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

    }

}