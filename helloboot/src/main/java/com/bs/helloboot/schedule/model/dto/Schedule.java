package com.bs.helloboot.schedule.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Schedule {
	private int scheduleNo;
	private String scheduleTitle;
	private String scheduleContent;
	private int scheduleLabel;
	private String schedulePlace;
	private String scheduleType;
	private String scheduleStartDate;
	private String scheduleEndDate;
}
