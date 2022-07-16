package com.rentcar.config;

import com.rentcar.application;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

public class ServletInitializer extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
<<<<<<<< HEAD:src/main/java/com/rentcar/config/ServletInitializer.java
		return application.sources(application.class);
========
		return application.sources(com.rentcar.application.class);
>>>>>>>> 0323eb73ac45c4e417df8ba7ef6ce4f94d28d67b:src/src/main/java/com/rentcar/config/ServletInitializer.java
	}

}
