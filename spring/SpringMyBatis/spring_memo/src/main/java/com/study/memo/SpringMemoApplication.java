package com.study.memo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.study.*"})
public class SpringMemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringMemoApplication.class, args);
	}

}
