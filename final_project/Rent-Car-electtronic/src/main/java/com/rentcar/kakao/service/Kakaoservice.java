package com.rentcar.kakao.service;

import com.rentcar.kakao.mapper.StoreMapper;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;
import net.minidev.json.parser.JSONParser;
import net.minidev.json.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class Kakaoservice {

    @Autowired
    private StoreMapper storeMapper;

    @Value("${kakao.ak}")
    private String ak;

    private String min_x = "";
    private String min_y = "";

    public JSONArray getMap(StringBuilder urlBuilder) throws IOException, ParseException {

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "KakaoAK " + ak);
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
        JSONObject obj = (JSONObject) parser.parse(sb.toString());
        JSONArray array = (JSONArray) obj.get("documents");

        List<Map<String, Object>> map = JsonUtil.getListMapFromJsonArray(array);
        int min_value = Integer.MAX_VALUE;

        for (int i = 0; i < map.size(); i++) {
            // 사용자 기준에서 가장 짧은 거리 정보(m)를 가져온다.
            int distence = Integer.parseInt((String) map.get(i).get("distance"));
            if (min_value > distence) {
                min_value = distence;
                min_x = (String) map.get(i).get("x");
                min_y = (String) map.get(i).get("y");
            }
        }


        String strJson = "{"
                + "lat:" + min_x + ","
                + "lng:" + min_y
                + "}";


        Object obj1 = parser.parse(strJson);
        JSONObject jsonObj = (JSONObject) obj1;
        array.appendElement(jsonObj);

        return array;
    }


}