package com.rentcar.kakao.controller;

import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;
import net.minidev.json.parser.JSONParser;
import net.minidev.json.parser.ParseException;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.jupiter.api.Test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

class KakaoRestApiHelperTest {

    @Test
    public void local_find_path() throws IOException, ParseException {

        /*
        https://dapi.kakao.com/v2/local/search/keyword.json?
        page=1&sort=accuracy&query=%EC%A0%84%EA%B8%B0+%EC%B6%A9%EC%A0%84%EC%86%8C&size=1
        */

        StringBuilder urlBuilder = new StringBuilder("https://dapi.kakao.com/v2/local/search/keyword.json"); /*URL*/

        urlBuilder.append("?" + URLEncoder.encode("page", "UTF-8") + "=" + 1);
        urlBuilder.append("&" + URLEncoder.encode("sort", "UTF-8") + "=" + "accuracy");
        urlBuilder.append("&" + URLEncoder.encode("query", "UTF-8") + "=" + URLEncoder.encode("전기차충전소", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("x", "UTF-8") + "=" + "37.769976567342");
        urlBuilder.append("&" + URLEncoder.encode("y", "UTF-8") + "=" + "126.693326928942");
        urlBuilder.append("&" + URLEncoder.encode("radius", "UTF-8") + "=" + 1000); // 1km
        // 최대 15 여야합니다.
        urlBuilder.append("&" + URLEncoder.encode("size", "UTF-8") + "=" + 15);

        System.out.println(urlBuilder);

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "KakaoAK " + "568d4e89c498ba7f3ca0d4c080bcf122");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.setRequestProperty("charset", "utf-8");


        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            System.out.println("에러발생!");
        }

        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }


        rd.close();
        conn.disconnect();
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(sb.toString());
        JSONObject jsonObject = (JSONObject) obj;
        JSONArray array = (JSONArray) jsonObject.get("documents");
        System.out.println(array);
        // x,y 값을 여기서 계산하자
        Map<String, Object> map = new HashMap<>();
        for (int i = 0; i < array.size(); i++) {
            JSONObject obj1 = (JSONObject) array.get(i);
            map.put("x", obj1.get("x"));
            map.put("y", obj1.get("y"));
        }
    }



}
