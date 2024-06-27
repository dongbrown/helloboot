package com.bs.helloboot.common.aop;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class LoggerAspect {

	@Before("execution(* com.bs.helloboot..*(..))")
	public void beforelog(JoinPoint jp) {
		log.debug("===== before aop =====");
		Signature sig = jp.getSignature();
		log.debug(sig.getDeclaringTypeName() + " " + sig.getName());
		log.debug("======================");
	}
}
