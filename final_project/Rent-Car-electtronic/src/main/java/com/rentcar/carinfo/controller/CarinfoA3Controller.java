package com.rentcar.carinfo.controller;

import com.rentcar.utility.Ncloud.AwsS3;
import com.rentcar.utility.Ncloud.service.AwsS3Service;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

    @RestController
    @RequestMapping("/carinfo")
    @RequiredArgsConstructor
    public class CarinfoA3Controller {

        private final AwsS3Service awsS3Service;

        @PostMapping("/resource")
        public AwsS3 upload(@RequestPart("filenameMF")
                            MultipartFile multipartFile) throws IOException {
//            AwsS3 a3 = awsS3Service.upload(multipartFile,"carinfo");
//        System.out.println(a3);
//        System.out.println(a3.getPath());
//        System.out.println(a3.getKey());
            return awsS3Service.upload(multipartFile,"carinfo");
        }

//        @DeleteMapping("/resource")
//        public void remove(AwsS3 awsS3) {
//            awsS3Service.remove(awsS3);
//        }
}
