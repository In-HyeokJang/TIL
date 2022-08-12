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

    @Autowired
    @Qualifier("com.rentcar.notice.service.NoticeServiceImpl")
    private NoticeService service;

    private final AwsS3Service awsS3Service;
    private final AmazonS3 amazonS3;
    private final AwsS3Config s3;

    private static final Logger log = LoggerFactory.getLogger(NoticeController.class);

    @GetMapping("/")
    public String home(Model model) {
        List<NoticeDTO> mainNoticeList = service.mainNoticeList();
        System.out.println("!!!!!!!!!!!!!"+mainNoticeList);
        model.addAttribute("mainNoticeList", mainNoticeList);
        return "/home";
    }

    @GetMapping("/home2")
    public String home(HttpServletRequest request) {
        List<NoticeDTO> mainNoticeList = service.mainNoticeList();
        request.setAttribute("mainNoticeList", mainNoticeList);
        return "/home2";
    }

    @GetMapping("/notice/fileDown")
    public void fileDown(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String noticeno = request.getParameter("noticeno");

        String fname = request.getParameter("key");
        String bucketName = "imagetest";
        String objectName = fname;
        String downloadFilePath = "D:/Github_upload/projectSaveF/files/";

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
        } catch (SdkClientException e) {
            e.printStackTrace();
        }

    }

    @ResponseBody
    @PostMapping("/admin/notice/deletefile")
    public String deleteFile(@RequestBody NoticeDTO dto) {

        String bucketName = "imagetest";
        String objectName = service.read(dto.getNoticeno()).getKey();

        try {
            amazonS3.deleteObject(bucketName, objectName);
            System.out.format("Object %s has been deleted.\n", objectName);
        } catch (AmazonS3Exception e) {
            e.printStackTrace();
        } catch (SdkClientException e) {
            e.printStackTrace();
        }
        service.deleteFile(dto.getNoticeno());

        return "/admin/notice/update";
    }

    @GetMapping("/admin/notice/update")
    public String update(int noticeno, Model model) {
        model.addAttribute("dto", service.read(noticeno));
        return "/admin/notice/update";
    }

    @ResponseBody
    @PostMapping("/admin/notice/update")
    public String update(NoticeDTO dto) throws IOException {
        Map map = new HashMap();
        map.put("noticeno", dto.getNoticeno());
        map.put("passwd", dto.getPasswd());
        log.info("map : " + map);

        int pcnt = service.passwd(map);

        log.info("pcnt : " + pcnt);

        int cnt = 0;
        if (pcnt == 1) {

            MultipartFile multipartFile = dto.getFnameMF();
            if (dto.getFnameMF() != null && !dto.getFnameMF().equals("")) {

                String bucketName = "imagetest";
                String objectName = service.read(dto.getNoticeno()).getKey();

                // delete object
                try {
                    amazonS3.deleteObject(bucketName, objectName);
                    System.out.format("Object %s has been deleted.\n", objectName);
                } catch (AmazonS3Exception e) {
                    e.printStackTrace();
                } catch (SdkClientException e) {
                    e.printStackTrace();
                }

                // 파일명으로 저장된다.
                dto.setFname(multipartFile.getOriginalFilename());
                AwsS3 S3 = awsS3Service.upload(dto.getFnameMF(), "notice");
                dto.setKey((String) S3.getKey());
            }
            cnt = service.update(dto);
        }

        if (pcnt != 1) {
            return "passwdError";
        } else if (cnt == 1) {
            return "/user/notice/list";
        } else {
            return "error";

        }

    }

    @PostMapping("/admin/notice/delete")
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
            } catch (SdkClientException e) {
                e.printStackTrace();
            }

            cnt = service.delete(noticeno);
        }

        if (pcnt != 1) {
            return "passwdError";
        } else if (cnt == 1) {
            return "/user/notice/list";
        } else {
            return "error";
        }

    }

    @GetMapping("/admin/notice/delete")
    public String delete(int noticeno) {
        return "/notice/delete";
    }

    @GetMapping("/admin/notice/create")
    public String create() {
        return "/admin/notice/create";
    }

    @ResponseBody
    @PostMapping("/admin/notice/create")
    public String create(NoticeDTO dto) throws IOException {

        MultipartFile multipartFile = dto.getFnameMF();
        if (dto.getFnameMF() != null && !dto.getFnameMF().equals("")) {
            // 파일명으로 저장된다.
            dto.setFname(multipartFile.getOriginalFilename());
            AwsS3 S3 = awsS3Service.upload(dto.getFnameMF(), "notice");
            dto.setKey((String) S3.getKey());

        }

        if (service.create(dto) > 0) {
            return "/user/notice/list";
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

        return "/user/notice/read";
    }

    @RequestMapping("/notice/list")
    public String list(HttpServletRequest request) {
        // 검색관련------------------------
        String col = Utility.checkNull(request.getParameter("col"));
        String word = Utility.checkNull(request.getParameter("word"));

        if (col.equals("total")) {
            word = "";
        }
        int nowPage = 1;// 현재 보고있는 페이지
        if (request.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }
        int recordPerPage = 10;

        int sno = ((nowPage - 1) * recordPerPage);


        Map map = new HashMap();
        map.put("col", col);
        map.put("word", word);
        map.put("sno", sno);
        map.put("cnt", recordPerPage);

        int total = service.total(map);

        List<NoticeDTO> list = service.list(map);
        String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

        request.setAttribute("list", list);
        request.setAttribute("nowPage", nowPage);
        request.setAttribute("col", col);
        request.setAttribute("word", word);
        request.setAttribute("paging", paging);

        return "/user/notice/list";

    }

}
