package com.rentcar.carinfo.controller;

import com.rentcar.utility.Ncloud.AwsS3;
import com.rentcar.utility.Ncloud.service.AwsS3Service;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

    @RestController
    @RequiredArgsConstructor
    public class A3Controller {

        private final AwsS3Service awsS3Service;

        @PostMapping("/carinfo/resource")
        public AwsS3 upload(@RequestPart("filenameMF")
                            MultipartFile multipartFile) throws IOException {
//            AwsS3 a3 = awsS3Service.upload(multipartFile,"carinfo");
//        System.out.println(a3);
//        System.out.println(a3.getPath());
//        System.out.println(a3.getKey());
            return awsS3Service.upload(multipartFile,"carinfo");
            // 나는 db에 키 값을 저장하고 싶어s3

        }
}
