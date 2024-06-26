package com.bs.helloboot.schedule.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bs.helloboot.schedule.model.dto.Schedule;
import com.bs.helloboot.schedule.model.service.ScheduleService;


@RestController
public class ScheduleController {
	
    @Autowired
    private ScheduleService service;

    @GetMapping("/schedule")
    public List<Schedule> getSchedules() {
    	return service.getSchedules();
    }

    @PostMapping("/updateSchedule")
    public String updateSchedule(@RequestBody Schedule schedule) {
//        scheduleService.updateSchedule(schedule);
        return "수정 성공";
    }

		
}
