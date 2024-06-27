package com.bs.helloboot.common;

import org.springframework.boot.context.properties.ConfigurationProperties;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@RequiredArgsConstructor
@Getter
@ToString
@ConfigurationProperties("linux")
public class LinuxData {
	private final String home;
	private final String url;
	private final int port;

}
