package com.rentcar.login.controller;

import com.rentcar.login.service.LoginService;
import com.rentcar.utility.Ncloud.AwsS3;
import com.rentcar.utility.Ncloud.service.AwsS3Service;
import com.rentcar.utility.UploadLicense;
import com.rentcar.utility.Utility;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RestController
public class LoginRestController {
    private static final Logger log = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    @Qualifier("com.rentcar.login.service.LoginServiceImpl")
    private LoginService service;

    @Value("${login.url}")
    private String apiURL;

    @Value("${login.secret-key}")
    private String secretKey;


    //ocr
    @PostMapping("/license")
    public ResponseEntity<Map> licInfo(MultipartFile fname) {

        String upDir = UploadLicense.getUploadDir();
        String fname2 = Utility.saveFileSpring(fname, upDir);

        String imageFile = UploadLicense.getUploadDir() + "\\" + fname2;

        Map map = new HashMap();

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
            Utility.writeMultiPart(wr, postParams, file, boundary);
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
            // System.out.println(response); // 문자열

            // ---------------------------------------json으로
            // String to Json Object
            JSONObject jsonObj = new JSONObject(response.toString());
            // System.out.println(jsonObj); https://jsonbeautifier.org/ 에서 확인
            JSONArray jsonArr = (JSONArray) jsonObj.get("images");
            // System.out.println(jsonArr); https://jsonbeautifier.org/ 에서 확인
            JSONObject jsonObj2 = (JSONObject) jsonArr.get(0);
            // System.out.println(jsonObj2); https://jsonbeautifier.org/ 에서 확인
            JSONArray jsonArr2 = (JSONArray) jsonObj2.get("fields");
            // System.out.println(jsonArr2); //https://jsonbeautifier.org/ 에서 확인
            // System.out.println(" 단어 수 : " + jsonArr2.length());// 단어수

            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < jsonArr2.length(); i++) {
                sb.append(" " + jsonArr2.getJSONObject(i).get("inferText"));

            }

            // System.out.println(sb);

            // ---- 운전면허증 사진에서 면허번호 추출하기
            int hypLic = sb.indexOf("-"); // 면허번호에 있는 맨 처음의 하이픈 위치번호

            String lic1 = sb.substring(hypLic - 2); // 맨처음 하이픈 앞의 두글자부터 추출 시작 //loginDTO엔 license로 저장되어있음
            // System.out.println(lic1);

            String license = lic1.substring(0, 16);
            // System.out.println("면허번호: " + lic);

            // ---- 운전면허증 사진에서 주민등록번호를 추출하기
            int hypJum = sb.lastIndexOf("-"); // 마지막 -의 위치번호 //hypenJ : 주민번호에 있는 하이픈

            String jumin1 = sb.substring(hypJum - 6); // - 기준 앞 6자리(생년월일)부터 시작 //jumin1 : 생년월일
            // System.out.println(jumin1);

            String jumin = jumin1.substring(0, 15); // 주민등록번호추출 (- 포함)
            // System.out.println("주민등록번호: " + jumin);

            map.put("license", license);
            map.put("jumin", jumin);

        } catch (Exception e) {
            System.out.println(e);
        }
        return new ResponseEntity<Map>(map, HttpStatus.OK);

    }


    @GetMapping("/user/pwfindex")
    public String pwfind(@RequestParam Map<String, String> map) {

        String pw = service.pwFind(map);

        if(pw != null && !pw.equals("")) {
            return "찾으시는 비밀번호는 "+pw+"입니다";
        }else {
            return "일치하는 정보가 없습니다.";
        }

    }

    @GetMapping("/user/idfindex")
    public String idfind(@RequestParam Map<String, String> map) {

        String id = service.idFind(map);

        if(id != null && !id.equals("")) {
            return "찾으시는 아이디는 "+id+ " 입니다.";
        }else {
            return "일치하는 정보가 없습니다.";
        }

    }



    @GetMapping(value = "/user/emailcheck", produces = "application/json;charset=utf-8")
    public Map<String, String> emailcheck(String email){
        int cnt = service.duplicatedEmail(email);

        Map<String, String> map = new HashMap<String, String>();
        if (cnt > 0) {
            map.put("str", email + "는 이미 사용 중인 이메일 입니다.");
        }else {
            map.put("str", email + "는 사용 가능한 이메일 입니다.");
        }
        return map;
    }


    @GetMapping(value = "/user/idcheck", produces = "application/json;charset=utf-8")
    public Map<String, String> idcheck(String id) {
        int cnt = service.duplicatedId(id);

        Map<String, String> map = new HashMap<String, String>();
        if (cnt > 0) {
            map.put("str", id + "는 이미 사용 중인 아이디입니다.");
        } else {
            map.put("str", id + "는 사용 가능한 아이디 입니다.");
        }
        return map;
    }

}
