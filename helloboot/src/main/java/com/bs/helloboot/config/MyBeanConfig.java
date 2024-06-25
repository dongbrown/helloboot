package com.bs.helloboot.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.fasterxml.jackson.databind.ObjectMapper;

@Configuration
// MyBatis 매퍼 인터페이스가 위치한 패키지를 스캔하여 빈으로 등록합니다.
@MapperScan("com.bs.helloboot.common.mappers")
public class MyBeanConfig {
    
    // ObjectMapper 빈을 정의합니다.
    @Bean
    ObjectMapper getMapper() {
        return new ObjectMapper();
    }
  
}
