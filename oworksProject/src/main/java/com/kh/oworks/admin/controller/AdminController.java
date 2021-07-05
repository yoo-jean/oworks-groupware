package com.kh.oworks.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.oworks.admin.model.service.AdminService;
import com.kh.oworks.admin.model.vo.Admin;
import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.common.template.Pagination;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	//관리자 근무관리_근태
	@RequestMapping("adList.at")
	public String adminAttendanceList() {
		return "admin/adminAttendanceListView";
	}
	
	//관리자 근무관리_근태_일일출퇴근현황
	@RequestMapping("adDailyList.at")
	public ModelAndView adminDailyAttendanceList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = aService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Admin> list = aService.selectList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("admin/adminDailyAttendanceListView");
		
		return mv;
	}
	
	//관리자 근무관리_휴가현황
	
	/*@RequestMapping("adList.off")
	public ModelAndView adminOffList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = aService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Admin> offList = aService.selectOffList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("offList", offList)
		  .setViewName("admin/adminOffListView");
		
		return mv;
	}*/
	@RequestMapping("adList.off")
	public String adminOffList() {
		return "admin/adminOffListView";
	}
	
	//관리자 근무관리_휴가_휴가분류관리
	@RequestMapping("adCate.off")
	public ModelAndView adminOffCate(ModelAndView mv) {
		ArrayList<Admin> offCate = aService.selectOffCate();
		
		mv.addObject("offCate", offCate)
		  .setViewName("admin/adminOffCate");
		return mv;
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
