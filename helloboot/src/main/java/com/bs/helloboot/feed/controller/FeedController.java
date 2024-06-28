//package com.bs.helloboot.feed.controller;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.bs.helloboot.feed.model.dto.Feed;
//
//@Controller
//@RequestMapping("/comunity")
//public class FeedController {
//
//	@Autowired
//	private FeedService service;
//
//	@GetMapping("/feed")
//	public String showFeed() {
//		return "comunity/feed";
//	}
//
//	@GetMapping("/feed")
//	@ResponseBody
//	public List<Map<String, Object>> getPosts(){
//		List<Feed> feeds = service.getFeeds();
//		List<Map<String, Object>> posts = new ArrayList<>();
//
//
//
//	}
//
//
//
//}
