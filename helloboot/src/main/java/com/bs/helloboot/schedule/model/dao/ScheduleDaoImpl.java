package com.bs.helloboot.schedule.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bs.helloboot.schedule.model.dto.Schedule;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {

	@Override
	public List<Schedule> getSchedules(SqlSession session) {
		return session.selectList("schedule.getSchedule");
	}

	@Override
	public void updateSchedule(Schedule schedule, SqlSession session) {
		session.update("schedule.updateSchedule", schedule);
	}


}