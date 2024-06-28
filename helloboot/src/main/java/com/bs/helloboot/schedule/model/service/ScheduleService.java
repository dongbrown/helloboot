package com.bs.helloboot.schedule.model.service;

import java.util.List;

import com.bs.helloboot.schedule.model.dto.Schedule;

public interface ScheduleService {
    List<Schedule> getSchedules();
    void updateSchedule(Schedule schedule);
	void addSchedule(Schedule schedule);

}
