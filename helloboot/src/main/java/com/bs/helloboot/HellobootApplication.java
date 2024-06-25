package com.bs.helloboot;

import java.util.Properties;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;

import com.bs.helloboot.config.MyBanner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootApplication
public class HellobootApplication {

	public static void main(String[] args) {
//		ConfigurableApplicationContext context =
//				SpringApplication.run(HellobootApplication.class, args);
//		Environment env = context.getBean(Environment.class);
//		log.debug(env.getProperty("server.port")); // -> 9090
		
		SpringApplication app = new SpringApplication(HellobootApplication.class);
		app.setWebApplicationType(WebApplicationType.SERVLET); // -> 크게 2가지 MVC모듈, Reactive웹(반응형) // 작성 안해도 알아서 타입 맞춤
		
		Properties prop = new Properties();
		prop.setProperty("server.port", "8888");
		app.setDefaultProperties(prop);
		app.setBanner(new MyBanner());
		app.run(args);
		// application.properties 에 포트번호 적으면 application.properties 우선 적용!(9090)
		
		
	}

}
