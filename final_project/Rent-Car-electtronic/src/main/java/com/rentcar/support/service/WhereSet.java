package com.rentcar.support.service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

public class WhereSet {

    public static Map SQLWhereSet(HttpServletRequest request, String col, String word) {

        if (col.equals("total")) {
            word = "";
        }

        int nowPage = 1;// 현재 보고있는 페이지 (처음들어왔을때 페이지??)
        if (request.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }
        int recordPerPage = 3;// 한페이지당 보여줄 레코드갯수

        // DB에서 가져올 순번-----------------
        int sno = ((nowPage - 1) * recordPerPage);
        // int eno = nowPage * recordPerPage;

        Map map = new HashMap();
        map.put("col", col); // select tag
        map.put("word", word); // 검색어
        map.put("sno", sno); // 현제 페이지 번호
        map.put("cnt", recordPerPage); // 페이지당 표시할 글 수

        return map;
    }

}
