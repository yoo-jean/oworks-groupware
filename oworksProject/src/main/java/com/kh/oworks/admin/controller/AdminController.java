package com.kh.oworks.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	//관리자 근무관리_근태
	@RequestMapping("adList.at")
	public String adminAttendanceList() {
		return "admin/adminAttendanceListView";
	}
	
	//관리자 근무관리_근태_일일출퇴근현황
	@RequestMapping("adDailyList.at")
	public String adminDailyAttendanceList() {
		return "admin/adminDailyAttendanceListView";
	}
	
	//관리자 근무관리_휴가
	@RequestMapping("adList.off")
	public String adminOffList() {
		return "admin/adminOffListView";
	}
	
	//관리자 근무관리_휴가_휴가분류관리
	@RequestMapping("adCate.off")
	public String adminOffCate() {
		return "admin/adminOffCate";
	}
	
	//관리자 부서관리
	@RequestMapping("list.dept")
	public String deptList() {
		return "admin/deptListView";
	}

	//관리자 직급관리
	@RequestMapping("list.job")
	public String jobList() {
		return "admin/jobListView";
	}
	
	

}
