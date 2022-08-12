package com.rentcar.list.controller;

import com.rentcar.utility.Ncloud.AwsS3;

import com.rentcar.utility.Ncloud.service.AwsS3Service;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@org.springframework.web.bind.annotation.RestController
@RequestMapping("/list")
@RequiredArgsConstructor
public class RestController {

    private final AwsS3Service awsS3Service;

    @PostMapping("/resource")
    public AwsS3 upload(@RequestPart("file") MultipartFile multipartFile) throws IOException {

System.out.println(multipartFile);
        return awsS3Service.upload(multipartFile, "list");
    }
}
