package com.bs.helloboot.schedule.model.service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.helloboot.schedule.model.dao.ScheduleDao;
import com.bs.helloboot.schedule.model.dto.Schedule;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ScheduleServiceImpl implements ScheduleService {

   private final ScheduleDao dao;
   private final SqlSession session;

    @Override
    public List<Schedule> getSchedules() {
        return dao.getSchedules(session);
    }

    @Override
    public void updateSchedule(Schedule schedule) {
        dao.updateSchedule(schedule, session);
    }

}
