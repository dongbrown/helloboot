package com.bs.helloboot.feed.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bs.helloboot.feed.model.dto.Feed;
import com.bs.helloboot.feed.model.service.FeedService;

@Controller
@RequestMapping("/community")
public class FeedController {

    @Autowired
    private FeedService service;

    @GetMapping("/feed")
    public String showFeed() {
        return "community/feed";
    }

    @GetMapping("/getPosts")
    public String getPosts(Model model,
                           @RequestParam(defaultValue = "1") int page,
                           @RequestParam(defaultValue = "10") int size) {
        try {
            List<Feed> feeds = service.getFeeds(page, size);
            model.addAttribute("posts", feeds);
            model.addAttribute("hasMore", feeds.size() == size);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "데이터를 가져오는 중 오류가 발생했습니다: " + e.getMessage());
        }
        return "community/getPosts";
    }
}