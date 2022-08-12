package com.rentcar.config;

import com.rentcar.config.error.AdminInterceptor;
import com.rentcar.config.error.UserInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MVCConfiguration implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        registry.addInterceptor(new UserInterceptor())
                .addPathPatterns("/user/**")
                .excludePathPatterns("/exception/**");

        registry.addInterceptor(new AdminInterceptor())
                .addPathPatterns("/admin/**");
    }
}