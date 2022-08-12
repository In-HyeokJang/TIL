package com.rentcar.carinfo.controller;

import com.rentcar.carinfo.model.CaroptionDTO;
import com.rentcar.carinfo.service.CarinfoService;
import com.rentcar.carinfo.service.CaroptionService;
import com.rentcar.utility.Ncloud.AwsS3;
import com.rentcar.utility.Ncloud.service.AwsS3Service;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;


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
