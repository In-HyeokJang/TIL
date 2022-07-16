package com.rentcar.config;
 
import com.rentcar.utility.UploadCon;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

<<<<<<<< HEAD:src/main/java/com/rentcar/config/WebMvcConfiguration.java
//import com.study.contents.UploadCon;
//import com.study.contents.*;
import com.rentcar.*;
========

//import com.study.contents.*;

>>>>>>>> 0323eb73ac45c4e417df8ba7ef6ce4f94d28d67b:src/src/main/java/com/rentcar/config/WebMvcConfiguration.java
 
@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Windows: path = "f:/AIstudy/deploy/shopping/contents/storage";
        // ▶ file:///f:/AIstudy/deploy/shopping/contents/storage
        // Ubuntu: path = "/home/ubuntu/deploy/shopping/contents/storage";
        // ▶ file:////home/ubuntu/deploy/shopping/contents/storage
        // JSP 인식되는 경로: http://localhost:8000/contents/storage";
<<<<<<<< HEAD:src/main/java/com/rentcar/config/WebMvcConfiguration.java
//        registry.addResourceHandler("/contents/storage/**")
//        .addResourceLocations("file:///" + UploadCon.getUploadDir());
========
        registry.addResourceHandler("/carinfo/storage/**")
        .addResourceLocations("file:///" + UploadCon.getUploadDir());
>>>>>>>> 0323eb73ac45c4e417df8ba7ef6ce4f94d28d67b:src/src/main/java/com/rentcar/config/WebMvcConfiguration.java
//        registry.addResourceHandler("/member/storage/**")
//                 .addResourceLocations("file:///" + UploadMem.getUploadDir());
    }
 
}