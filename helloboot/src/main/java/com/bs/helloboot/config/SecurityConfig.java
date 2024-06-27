package com.bs.helloboot.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsUtils;

import com.bs.helloboot.common.BSExceptionHandler;
import com.bs.helloboot.common.MyAuthority;
import com.bs.helloboot.security.controller.UserPasswordAuthenticationProvider;

import lombok.RequiredArgsConstructor;

@Configuration // 스프링의 설정 클래스임을 나타냄
@EnableWebSecurity // 웹 보안 기능을 활성화
@RequiredArgsConstructor // final 필드에 대한 생성자를 자동으로 생성
public class SecurityConfig {

    private final UserPasswordAuthenticationProvider provider; // 커스텀 인증 프로바이더 주입

    // SecurityFilterChain을 빈으로 등록하여 스프링 시큐리티 설정
    @Bean
    SecurityFilterChain authenticationFilter(HttpSecurity http) throws Exception {
        return http
            .csrf(csrf -> csrf.disable()) // CSRF 보호 기능 비활성화
            .authorizeHttpRequests(request -> request
//            	.requestMatchers(req -> CorsUtils.isPreFlightRequest(req)).permitAll()
            		// -> CORS 프리플라이트 요청에 대해 인증 없이 접근을 허용하는 것
            		//  -> <WebMvcConfig> addCorsMappings()와 관련
            	.requestMatchers(CorsUtils::isPreFlightRequest).permitAll()
                // 루트 경로와 /WEB-INF/views/** 경로는 모든 사용자에게 허용
                .requestMatchers("/", "loginpage" ,"/WEB-INF/views/**").permitAll()
                // /api/** 경로는 "user" 권한을 가진 사용자에게만 허용
                .requestMatchers("/api/**", "/board/**")
                	.hasAnyAuthority(MyAuthority.USER.name())
                // 그 외 모든 요청은 인증된 사용자에게만 허용
                .requestMatchers("/admin/**")
                	.hasAnyAuthority(MyAuthority.ADMIN.name())
                .anyRequest().authenticated()
            )
            .authenticationProvider(provider) // 커스텀 인증 프로바이더 설정

            .formLogin(form -> form
            		.loginProcessingUrl("/logintest")
//             		.loginPage("/loginpage")  // -> login.jsp로, 설정 안하면 기본 로그인페이지
//            		.successForwardUrl(null)
//            		.failureForwardUrl(null)
//            		.loginPage(null)
            )
//            .logout(logout -> logout
//            		.logoutUrl(null)
//            		.logoutSuccessUrl(null)
//            )
            .exceptionHandling(exception -> exception // BSExceptionHandler implements AccessDeniedHandler (common)
            		.accessDeniedHandler(new BSExceptionHandler()))
            .build(); // HttpSecurity 객체 빌드
    }
}