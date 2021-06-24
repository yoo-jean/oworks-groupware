package com.kh.oworks.commute.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommuteController {
	
	//사용자 인사관리_휴가관리
	@RequestMapping("list.off")
	public String offList() {
		return "commute/offListView";
	}
	
	//사용자 인사관리_휴가관리_신청서작성
	@RequestMapping("enroll.off")
	public String offEnroll() {
		return "commute/offRequest";
	}
	
	//사용자 인사관리_근무현황
	@RequestMapping("list.at")
	public String attendanceList() {
		return "commute/attendanceListView";
	}
	
}
