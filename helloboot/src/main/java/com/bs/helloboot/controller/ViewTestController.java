package com.bs.helloboot.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bs.helloboot.common.LinuxData;
import com.bs.helloboot.model.dto.Member;

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
	public String main(Model m) {
		log.info("{}", linuxData);
//		log.info(home);
//		log.info(url);
//		log.info("{}", port);
		m.addAttribute("name", "김동훈");
		Member member = Member.builder()
				.userId("donghoon")
				.password("1234")
				.name("김동훈")
				.age(29)
				.address("경기도 안양시")
				.build();
		m.addAttribute("member", member);

		List<String> names = List.of("김명준", "최선웅", "고재현", "임성욱");
		m.addAttribute("names", names);

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
