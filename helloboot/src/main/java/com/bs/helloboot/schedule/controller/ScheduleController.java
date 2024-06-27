package com.bs.helloboot.schedule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.helloboot.schedule.model.dto.Schedule;
import com.bs.helloboot.schedule.model.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {

    @Autowired
    private ScheduleService service;

    @GetMapping("/calendar")
    public String showCalendar() {
        return "schedule/calendar"; // calendar.jsp를 찾아 렌더링합니다.
    }

    @GetMapping("/schedule")
    @ResponseBody
    public List<Map<String, Object>> getSchedules() {
        List<Schedule> schedules = service.getSchedules();
        List<Map<String, Object>> events = new ArrayList<>();

        for (Schedule schedule : schedules) {
            Map<String, Object> event = new HashMap<>();
            event.put("id", schedule.getId());
            event.put("title", schedule.getTitle());
            event.put("start", schedule.getStart());
            event.put("end", schedule.getEnd());
            event.put("allDay", schedule.isAllDay());
            event.put("color", schedule.getColor());
            // 필요한 다른 필드들도 추가
            events.add(event);
        }

        return events;
    }

    @PostMapping("/updateSchedule")
    @ResponseBody
    public ResponseEntity<String> updateSchedule(@RequestBody Schedule schedule) {
        try {
            service.updateSchedule(schedule);
            return ResponseEntity.ok("일정이 성공적으로 업데이트되었습니다");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body("일정 업데이트 중 오류 발생: " + e.getMessage());
        }
    }
}