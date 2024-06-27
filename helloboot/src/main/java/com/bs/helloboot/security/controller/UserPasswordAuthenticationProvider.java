package com.bs.helloboot.security.controller;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.bs.helloboot.common.mappers.MemberMapper;
import com.bs.helloboot.model.dto.Member;

import lombok.RequiredArgsConstructor;

@Component // 스프링 컨테이너에 빈으로 등록
@RequiredArgsConstructor // final 필드에 대한 생성자를 자동으로 생성
public class UserPasswordAuthenticationProvider implements AuthenticationProvider {

    private final MemberMapper mapper; // 회원 정보를 조회하기 위한 매퍼
    private BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder(); // 비밀번호 암호화를 위한 인코더

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String userId = authentication.getName(); // 클라이언트가 보낸 아이디
        String password = (String)authentication.getCredentials(); // 클라이언트가 보낸 비밀번호

        // DB에서 사용자 정보 조회
        Member loginMember = mapper.selectMemberbyId(userId);

        // 사용자가 존재하고 비밀번호가 일치하는 경우
        if(loginMember != null && pwEncoder.matches(password, loginMember.getPassword())) {
            // 인증 성공 시 새로운 Authentication 객체 생성
            return new UsernamePasswordAuthenticationToken(
                loginMember,
                loginMember.getPassword(),
                loginMember.getAuthorities()
            );
        } else {
            // 인증 실패 시 예외 발생
            throw new BadCredentialsException("인증 실패");
        }
    }

    @Override
    public boolean supports(Class<?> authentication) {
        // 이 provider가 UsernamePasswordAuthenticationToken 타입의 인증을 지원하는지 확인
        return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
    }
}