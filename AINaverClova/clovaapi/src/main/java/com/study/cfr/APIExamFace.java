package com.study.cfr;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

import org.json.JSONArray;
import org.json.JSONObject;

// 네이버 얼굴인식 API 예제
public class APIExamFace {

  public static void main(String[] args) {

    StringBuffer reqStr = new StringBuffer();
    String clientId = "427hi7wqlh";// 애플리케이션 클라이언트 아이디값";
    String clientSecret = "CLBH7Wt1sfkLgJAaHmk3nnnOWLEuCDMsvmaEMI8u";// 애플리케이션 클라이언트 시크릿값";

    try {
      String paramName = "image"; // 파라미터명은 image로 지정
      String imgFile = "C:\\Aistudy_JIH\\ncloud\\CFR\\검은 사제들.jpg";
      File uploadFile = new File(imgFile);
      String apiURL = "https://naveropenapi.apigw.ntruss.com/vision/v1/celebrity"; // 유명인 얼굴 인식
      // String apiURL = "https://naveropenapi.apigw.ntruss.com/vision/v1/face"; // 얼굴
      // 감지
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection) url.openConnection();
      con.setUseCaches(false);
      con.setDoOutput(true);
      con.setDoInput(true);
      // multipart request
      String boundary = "---" + System.currentTimeMillis() + "---";
      con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
      con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
      con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
      OutputStream outputStream = con.getOutputStream();
      PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream, "UTF-8"), true);
      String LINE_FEED = "\r\n";
      // file 추가
      String fileName = uploadFile.getName();
      writer.append("--" + boundary).append(LINE_FEED);
      writer.append("Content-Disposition: form-data; name=\"" + paramName + "\"; filename=\"" + fileName + "\"")
          .append(LINE_FEED);
      writer.append("Content-Type: " + URLConnection.guessContentTypeFromName(fileName)).append(LINE_FEED);
      writer.append(LINE_FEED);
      writer.flush();
      FileInputStream inputStream = new FileInputStream(uploadFile);
      byte[] buffer = new byte[4096];
      int bytesRead = -1;
      while ((bytesRead = inputStream.read(buffer)) != -1) {
        outputStream.write(buffer, 0, bytesRead);
      }
      outputStream.flush();
      inputStream.close();
      writer.append(LINE_FEED).flush();
      writer.append("--" + boundary + "--").append(LINE_FEED);
      writer.close();
      BufferedReader br = null;
      int responseCode = con.getResponseCode();
      if (responseCode == 200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else { // 오류 발생
        System.out.println("error!!!!!!! responseCode= " + responseCode);
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      }
      String inputLine;
      if (br != null) {
        StringBuffer response = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
          response.append(inputLine);
        }
        br.close();
        // System.out.println(response.toString());

        // String to Json Object
        JSONObject jsonObj = new JSONObject(response.toString());
        JSONObject jsonObj2 = (JSONObject) jsonObj.get("info"); // https://jsonbeautifier.org/ 에서 확인
        int facecnt = (int) jsonObj2.get("faceCount");
        System.out.println("발견된 얼굴 수 :" + facecnt);

        JSONArray jsonArr = (JSONArray) jsonObj.get("faces");

        // System.out.println(jsonArr); //https://jsonbeautifier.org/ 에서 확인

        for (int i = 0; i < jsonArr.length(); i++) {
          String name = jsonArr.getJSONObject(i).getJSONObject("celebrity").get("value").toString();
          String per = jsonArr.getJSONObject(i).getJSONObject("celebrity").get("confidence").toString();
          double per2 = Double.parseDouble(per);
          System.out.printf("감지된 얼굴: %d : %s %7.2f %% \n", (i + 1), name, (per2 * 100));

        }

      } else {
        System.out.println("error !!!");
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  }
}