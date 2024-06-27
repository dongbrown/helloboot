package com.bs.helloboot.controller;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bs.helloboot.common.LinuxData;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ViewTestController {

//	@Value("${linux.home}")
//	private String home;
//	@Value("${linux.url}")
//	private String url;
//	@Value("${linux.port}")
//	private int port;

	@Autowired
	private LinuxData linuxData;



	@RequestMapping("/")
	public String main() {
		log.info("{}", linuxData);
//		log.info(home);
//		log.info(url);
//		log.info("{}", port);


		return "index";
	}
	//의존성 등록 -> pom.xml

	@PostMapping("/fileupload.do")
	public String flieUpload(MultipartFile[] upFile) {
		//application.properties에 debug 설정
		Arrays.stream(upFile).forEach(file -> {
			log.debug(file.getOriginalFilename());
			log.debug("{}", file.getSize());
		});

		return "redirect:/";
	}
}
