package com.bs.helloboot.schedule.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bs.helloboot.schedule.model.dto.Schedule;

public interface ScheduleDao {
	List<Schedule> getSchedules(SqlSession session);

	void updateSchedule(Schedule schedule, SqlSession session);
}
