package com.rentcar.utility.Ncloud.controller;

import com.rentcar.utility.Ncloud.AwsS3;
import com.rentcar.utility.Ncloud.service.AwsS3Service;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping("/s3")
@RequiredArgsConstructor
public class AwsS3Controller {

    private final AwsS3Service awsS3Service;

    @PostMapping("/resource")
    public AwsS3 upload(@RequestPart("file")
                            MultipartFile multipartFile) throws IOException {

        return awsS3Service.upload(multipartFile,"user");
        // 나는 db에 키 값을 저장하고 싶어

    }

    @GetMapping("/resource/{idx}")
    public void get(@PathVariable("idx") String idx) {

        awsS3Service.get(idx);
    }

    @DeleteMapping("/resource")
    public void remove(AwsS3 awsS3) {
        awsS3Service.remove(awsS3);
    }


//    이미지 불러오기
//    @GetMapping("/carinfo/{carnumber}")
//    public void read(@PathVariable("carnumber") String carumber){
//        Carinfo C = mapper.read(carumber);
//    }
}