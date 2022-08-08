package com.rentcar.notice.controller;

import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.AmazonS3Exception;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.rentcar.notice.model.NoticeDTO;
import com.rentcar.notice.model.UploadNotice;
import com.rentcar.notice.service.NoticeService;
import com.rentcar.utility.Ncloud.AwsS3;
import com.rentcar.utility.Ncloud.AwsS3Config;
import com.rentcar.utility.Ncloud.service.AwsS3Service;
import com.rentcar.utility.Utility;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor

public class NoticeController {

//    @Value("${cloud.naver.endPoint}")
//    final String endPoint;
//    @Value("${cloud.naver.region}")
//    final String regionName;
//    @Value("${cloud.naver.credentials.access-key}")
//    final String accessKey;
//    @Value("${cloud.naver.credentials.secret-key}")
//    final String secretKey;

    @Autowired
    @Qualifier("com.rentcar.notice.service.NoticeServiceImpl")
    private NoticeService service;

    private final AwsS3Service awsS3Service;

    private final AmazonS3 amazonS3;

    final AwsS3Config s3;

    private static final Logger log = LoggerFactory.getLogger(NoticeController.class);

    @GetMapping
    public String home() {

        return "/home";
    }

    @GetMapping("/notice/fileDown")
    public void fileDown(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 저장 폴더를 절대 경로로 변환
 //       String dir = UploadNotice.getUploadDir();
        // 파일명 받기
        //String fname = request.getParameter("fname");
        String noticeno = request.getParameter("noticeno");
//        NoticeDTO dto = service.read(Integer.parseInt(noticeno));

        String fname = request.getParameter("key");

        String bucketName = "imagetest";
        String objectName = fname;
        String downloadFilePath = "D:/Github_upload/projectSaveF/files/";

// download object
        try {
            S3Object s3Object = amazonS3.getObject(bucketName, objectName);
            S3ObjectInputStream s3ObjectInputStream = s3Object.getObjectContent();

            OutputStream outputStream = new BufferedOutputStream(new FileOutputStream(downloadFilePath));
            byte[] bytesArray = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = s3ObjectInputStream.read(bytesArray)) != -1) {
                outputStream.write(bytesArray, 0, bytesRead);
            }

            outputStream.close();
            s3ObjectInputStream.close();
            System.out.format("Object %s has been downloaded.\n", objectName);
        } catch (AmazonS3Exception e) {
            e.printStackTrace();
        } catch(SdkClientException e) {
            e.printStackTrace();
        }

//        String downloadFilePath = "D:/Github_upload/projectSaveF/files/";
//
//  //      Runtime.getRuntime().exec("chmod -R 777 " + downloadFilePath);
//
//        log.info("pathFile    :    " + fname);
//
//
//// download object
//        try {
//            S3Object s3Object = amazonS3.getObject("imagetest", fname);
//            S3ObjectInputStream s3ObjectInputStream = s3Object.getObjectContent();
//
//            OutputStream outputStream = new BufferedOutputStream(new FileOutputStream(downloadFilePath));
//
//            byte[] bytesArray = new byte[4096];
//            int bytesRead = -1;
//            while ((bytesRead = s3ObjectInputStream.read(bytesArray)) != -1) {
//                outputStream.write(bytesArray, 0, bytesRead);
//            }
//
//            outputStream.close();
//            s3ObjectInputStream.close();
//            System.out.format("Object %s has been downloaded.\n", fname);
//
//        } catch (AmazonS3Exception e) {
//            e.printStackTrace();
//        } catch (SdkClientException e) {
//            e.printStackTrace();
//        }
//
//        byte[] files = FileUtils.readFileToByteArray(new File(dir, fname));
//        response.setHeader("Content-disposition", "attachment; fileName=\"" + URLEncoder.encode(fname, "UTF-8") + "\";");
//
//        // Content-Transfer-Encoding : 전송 데이타의 body를 인코딩한 방법을 표시함.
//        response.setHeader("Content-Transfer-Encoding", "binary");
//        /**
//         * Content-Disposition가 attachment와 함게 설정되었다면 'Save As'로 파일을 제안하는지 여부에 따라 브라우저가
//         * 실행한다.
//         */
//        response.setContentType("application/octet-stream");
//        response.setContentLength(files.length);
//        response.getOutputStream().write(files);
//        response.getOutputStream().flush();
//        response.getOutputStream().close();

//  로컬에 저장된 파일을 다운 받는것
//        // 저장 폴더를 절대 경로로 변환
//        String dir = UploadNotice.getUploadDir();
//        // 파일명 받기
//        String fname = request.getParameter("fname");
//        byte[] files = FileUtils.readFileToByteArray(new File(dir, fname));
//        response.setHeader("Content-disposition", "attachment; fileName=\"" + URLEncoder.encode(fname, "UTF-8") + "\";");
//
//        // Content-Transfer-Encoding : 전송 데이타의 body를 인코딩한 방법을 표시함.
//        response.setHeader("Content-Transfer-Encoding", "binary");
//        /**
//         * Content-Disposition가 attachment와 함게 설정되었다면 'Save As'로 파일을 제안하는지 여부에 따라 브라우저가
//         * 실행한다.
//         */
//        response.setContentType("application/octet-stream");
//        response.setContentLength(files.length);
//        response.getOutputStream().write(files);
//        response.getOutputStream().flush();
//        response.getOutputStream().close();
    }


//    @PostMapping(value = "/notice/deletefile", produces = "application/json")
//    public ResponseEntity deleteFile(@RequestBody Map<Object, Object> objectMap) {
//        System.out.println("objectMap   )    " + objectMap);
//        Map<Object, Object> map = new HashMap<>();
//
//        int noticeno = (int) map.get("noticeno");
//        String oldFile = (String) map.get("oldfile");
//
//        String upDir = UploadNotice.getUploadDir();
//
//        service.deleteFile(noticeno);
//
//        Utility.deleteFile(upDir, oldFile);
//
//        return null;
//    }

    @ResponseBody
    @PostMapping("/notice/deletefile")
    public String deleteFile(@RequestBody NoticeDTO dto) {

        log.info("noticeno : " + dto.getNoticeno());
        log.info("oldFile : " + dto.getFname());
       log.info("key : " + service.read(dto.getNoticeno()).getKey());
//          Map map = new HashMap();
//
//            map.put("noticeno",noticeno);
//            map.put("oldFile",oldFile);

//            System.out.println(map.values());

//        String upDir = UploadNotice.getUploadDir();

//        service.deleteFile(noticeno);

//        Utility.deleteFile(upDir, oldFile);

 //       service.deleteFile(dto.getNoticeno());
//        awsS3Service.remove(awsS3Service.upload(dto.getFnameMF(), "notice"));

//        try {
//            amazonS3.deleteObject("notice", service.read(dto.getNoticeno()).getKey().substring(7));
//            System.out.format("Object %s has been deleted.\n", service.read(dto.getNoticeno()).getKey().substring(7));
//        } catch (AmazonS3Exception e) {
//            e.printStackTrace();
//        } catch(SdkClientException e) {
//            e.printStackTrace();
//        }

            // S3 client

            String bucketName = "imagetest";
            String objectName = service.read(dto.getNoticeno()).getKey();

// delete object
            try {
                amazonS3.deleteObject(bucketName, objectName);
                System.out.format("Object %s has been deleted.\n", objectName);
            } catch (AmazonS3Exception e) {
                e.printStackTrace();
            } catch(SdkClientException e) {
                e.printStackTrace();
            }


        service.deleteFile(dto.getNoticeno());

//        MultipartFile multipartFile = dto.getFnameMF();
//        if (dto.getFnameMF() != null && !dto.getFnameMF().equals("")) {
//            // 파일명으로 저장된다.
//            dto.setFname(multipartFile.getOriginalFilename());


//            dto.setKey((String) S3.getKey());
//        }
//
//        if (service.create(dto) > 0) {
//            return "/notice/list";
//        } else {
//            return "error";
//        }

        return "/notice/update";

    }

    @GetMapping("/notice/update")
    public String update(int noticeno, Model model) {

        model.addAttribute("dto", service.read(noticeno));

        return "/notice/update";
    }

    @PostMapping("/notice/update")
    public String update(NoticeDTO dto) {
        Map map = new HashMap();
        map.put("noticeno", dto.getNoticeno());
        map.put("passwd", dto.getPasswd());
        int pcnt = service.passwd(map);

        int cnt = 0;
        if (pcnt == 1) {

            cnt = service.update(dto);
        }

        if (pcnt != 1) {
            return "passwdError";
        } else if (cnt == 1) {
            return "redirect:./list";
        } else {
            return "error";

        }

    }

    @PostMapping("/notice/delete")
    public String delete(HttpServletRequest request, int noticeno, String passwd, String oldfile) {


        Map map = new HashMap();
        map.put("noticeno", noticeno);
        map.put("passwd", passwd);

        String upDir = UploadNotice.getUploadDir();

        int pcnt = service.passwd(map);

        log.info("passwd :", pcnt);

        int cnt = 0;
        if (pcnt == 1) {

            String bucketName = "imagetest";
            String objectName = service.read(noticeno).getKey();

            // delete object
            try {
                amazonS3.deleteObject(bucketName, objectName);
                System.out.format("Object %s has been deleted.\n", objectName);
            } catch (AmazonS3Exception e) {
                e.printStackTrace();
            } catch(SdkClientException e) {
                e.printStackTrace();
            }

            cnt = service.delete(noticeno);
        }

        if (pcnt != 1) {
            return "passwdError";
        } else if (cnt == 1) {
            return "redirect:./list";
        } else {
            return "error";
        }

    }

    @GetMapping("/notice/delete")
    public String delete(int noticeno) {
        return "/notice/delete";
    }

    @GetMapping("/notice/create")
    public String create() {

        return "/notice/create";
    }
    @ResponseBody
    @PostMapping("/notice/create")
    public String create(NoticeDTO dto) throws IOException {

        log.info("dto: " + dto.getContent());
        log.info("dto: " + dto.getTitle());
        log.info("dto: " + dto.getWname());
        log.info("dto: " + dto.getFnameMF());

// 로컬 저장 소스

//        String upDir = UploadNotice.getUploadDir();
//        if(dto.getFnameMF() != null && !dto.getFnameMF().equals("")) {
//            String fname = Utility.saveFileSpring(dto.getFnameMF(), upDir);
//
//            log.info("fname:" + fname);
//
//
//            dto.setFname(fname);
//
//        }
//        if (service.create(dto) > 0) {
//            return "ok";
//        } else {
//            return "error";
//        }

// AWS 사용

        //String fname = dto.getFname(dto.getFnameMF());


        MultipartFile multipartFile = dto.getFnameMF();
        if (dto.getFnameMF() != null && !dto.getFnameMF().equals("")) {
            // 파일명으로 저장된다.
            dto.setFname(multipartFile.getOriginalFilename());
            AwsS3 S3 = awsS3Service.upload(dto.getFnameMF(), "notice");
            dto.setKey((String) S3.getKey());
        }

        if (service.create(dto) > 0) {
            return "/notice/list";
        } else {
            return "error";
        }
    }

    @GetMapping("/notice/read")
    public String read(int noticeno, Model model) {

        NoticeDTO dto = service.read(noticeno);

        String content = dto.getContent().replaceAll("\r\n", "<br>");

        dto.setContent(content);

        model.addAttribute("dto", dto);

        return "/notice/read";
    }

    @RequestMapping("/notice/list")
    public String list(HttpServletRequest request) {
        // 검색관련------------------------
        String col = Utility.checkNull(request.getParameter("col"));
        String word = Utility.checkNull(request.getParameter("word"));

        if (col.equals("total")) {
            word = "";
        }

        // 페이지관련-----------------------
        int nowPage = 1;// 현재 보고있는 페이지
        if (request.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }
        int recordPerPage = 3;// 한페이지당 보여줄 레코드갯수

        // DB에서 가져올 순번-----------------
        int sno = ((nowPage - 1) * recordPerPage);
        //sql limit: 0부터 시작, 가져올 갯수 ===> sno,cnt
        //nowPage 는 1부터 시작됨

        // int eno = nowPage * recordPerPage;

        Map map = new HashMap();
        map.put("col", col);
        map.put("word", word);
        map.put("sno", sno);
        map.put("cnt", recordPerPage);

        int total = service.total(map);

        List<NoticeDTO> list = service.list(map);


        String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

        // request에 Model사용 결과 담는다
        request.setAttribute("list", list);
        request.setAttribute("nowPage", nowPage);
        request.setAttribute("col", col);
        request.setAttribute("word", word);
        request.setAttribute("paging", paging);

        // view페이지 리턴
        return "/notice/list";

    }

}
