package com.kh.oworks.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {

	//회의실 예약가능 목록
	@RequestMapping("list.mr")
	public String roomList() {
		return "schedule/roomListView";
	}
	
	//회의실 예약 작성
	@RequestMapping("enrollForm.mr")
	public String roomEnrollForm() {
		return "schedule/roomEnrollForm";
	}
	
	//회의실 예약내역
	@RequestMapping("listHistory.mr")
	public String roomHistoryList() {
		return "schedule/roomHistoryListView";
	}
	
	
	
	
	
	
	
	
	
}
