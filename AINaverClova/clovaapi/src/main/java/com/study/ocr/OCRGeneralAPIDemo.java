package com.study.ocr;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;

public class OCRGeneralAPIDemo {

  public static void main(String[] args) {
    String apiURL = "https://0oe8jve3j4.apigw.ntruss.com/custom/v1/16869/83050ee89a1b0c80bf5c1d4a4f14359bfeb55294b354032ac8d797ff55fb106f/general";
    String secretKey = "Q3pjdUNpWkxIekhVUk9wd1N1blluWUdjemhIQ2R6UGs=";
    String imageFile = "C:\\Aistudy_JIH\\ncloud\\OCR\\sample1.jpg";

    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection) url.openConnection();
      con.setUseCaches(false);
      con.setDoInput(true);
      con.setDoOutput(true);
      con.setReadTimeout(30000);
      con.setRequestMethod("POST");
      String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
      con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
      con.setRequestProperty("X-OCR-SECRET", secretKey);

      JSONObject json = new JSONObject();
      json.put("version", "V2");
      json.put("requestId", UUID.randomUUID().toString());
      json.put("timestamp", System.currentTimeMillis());
      JSONObject image = new JSONObject();
      image.put("format", "jpg");
      image.put("name", "demo");
      JSONArray images = new JSONArray();
      images.put(image);
      json.put("images", images);
      String postParams = json.toString();

      con.connect();
      DataOutputStream wr = new DataOutputStream(con.getOutputStream());
      long start = System.currentTimeMillis();
      File file = new File(imageFile);
      writeMultiPart(wr, postParams, file, boundary);
      wr.close();

      int responseCode = con.getResponseCode();
      BufferedReader br;
      if (responseCode == 200) {
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer response = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        response.append(inputLine);
      }
      br.close();
      System.out.println(response); // 문자열

      // String to Json Object
       JSONObject jsonObj = new JSONObject(response.toString());
      //System.out.println(jsonObj);// https://jsonbeautifier.org/ 에서 확인
       JSONArray jsonArr = (JSONArray)jsonObj.get("images");
      // System.out.println(jsonArr); https://jsonbeautifier.org/ 에서 확인
       JSONObject jsonObj2 = (JSONObject)jsonArr.get(0);
      // System.out.println(jsonObj2); https://jsonbeautifier.org/ 에서 확인
       JSONArray jsonArr2 = (JSONArray)jsonObj2.get("fields");
      // System.out.println(jsonArr2); https://jsonbeautifier.org/ 에서 확인
      System.out.println(" 단어 수 : "+jsonArr2.length());//단어수
      StringBuffer sb = new StringBuffer();
      for(int i= 0 ; i<jsonArr2.length(); i++) {
        sb.append(" "+jsonArr2.getJSONObject(i).get("inferText"));
        if(i==1) {sb.append("\n");}
        
      }
      System.out.println(sb);

    } catch (Exception e) {
      System.out.println(e);
    }
  }

  private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary)
      throws IOException {
    StringBuilder sb = new StringBuilder();
    sb.append("--").append(boundary).append("\r\n");
    sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
    sb.append(jsonMessage);
    sb.append("\r\n");

    out.write(sb.toString().getBytes("UTF-8"));
    out.flush();

    if (file != null && file.isFile()) {
      out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
      StringBuilder fileString = new StringBuilder();
      fileString.append("Content-Disposition:form-data; name=\"file\"; filename=");
      fileString.append("\"" + file.getName() + "\"\r\n");
      fileString.append("Content-Type: application/octet-stream\r\n\r\n");
      out.write(fileString.toString().getBytes("UTF-8"));
      out.flush();

      try (FileInputStream fis = new FileInputStream(file)) {
        byte[] buffer = new byte[8192];
        int count;
        while ((count = fis.read(buffer)) != -1) {
          out.write(buffer, 0, count);
        }
        out.write("\r\n".getBytes());
      }

      out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
    }
    out.flush();
  }
}