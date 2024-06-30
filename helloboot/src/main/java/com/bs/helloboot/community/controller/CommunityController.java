package com.bs.helloboot.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bs.helloboot.community.model.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {

	@Autowired
	private CommunityService service;

	@GetMapping("/community")
	public String showCommunity() {
		return "community/community";
	}


}
