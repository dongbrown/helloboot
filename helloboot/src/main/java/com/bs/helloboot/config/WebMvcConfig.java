package com.bs.helloboot.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.BeanNameViewResolver;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.bs.helloboot.chatting.ChattingServer;
import com.bs.helloboot.common.interceptor.TestInterceptor;

import lombok.RequiredArgsConstructor;

//mvc에 대한 context config(설정)
@Configuration
@EnableAspectJAutoProxy // -> aspectj 사용할 수 있음(LoggerAsepect)
@EnableWebSocket
@RequiredArgsConstructor
public class WebMvcConfig implements WebMvcConfigurer, WebSocketConfigurer {

	private final ChattingServer chatServer;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(testInterceptor()).addPathPatterns("/**");
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/loginpage").setViewName("login");
	}

	@Bean
	TestInterceptor testInterceptor() {
		return new TestInterceptor();
	}

//	@Bean
//	HadnlerExceptionResolver hadlerExceptionResolver() {
//
//	}

//	@Bean
//	ViewResolver beanNameViewResolver() {
//		return new BeanNameViewResolver();
//	}

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**").allowedOrigins("http://localhost:3000"); // 리액트 포트번호 3000 , *쓰면 모두 허용
		// 3000포트에서 보내는 것을 내 주소에서 받겠다
	}

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(chatServer, "/chat");
	}

}
