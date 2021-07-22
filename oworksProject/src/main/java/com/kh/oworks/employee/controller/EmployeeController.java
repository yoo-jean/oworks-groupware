package com.kh.oworks.employee.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.oworks.board.model.service.NoticeService;
import com.kh.oworks.board.model.vo.Notice;
import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.common.template.Pagination;
import com.kh.oworks.commute.model.service.CommuteService;
import com.kh.oworks.commute.model.vo.Commute;
import com.kh.oworks.commute.model.vo.CommuteMain;
import com.kh.oworks.employee.model.service.EmployeeService;
import com.kh.oworks.employee.model.vo.Employee;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService eService;
	
	@Autowired
	private NoticeService nService;
	
	@Autowired
	private CommuteService cService;
	
	@RequestMapping("login.emp")
	public ModelAndView loginEmployee(Employee e, Commute c, HttpSession session, @RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv, HttpServletRequest request) {
		
		Employee loginEmp = eService.loginEmployee(e);
		if (loginEmp == null)
			loginEmp = (Employee)session.getAttribute("loginEmp");
		//System.out.println("loginEmp:"+loginEmp);
		session.setAttribute("loginEmp", loginEmp);
		
		// 메인화면에서 공지사항 확인
		int listCount = nService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Notice> list = nService.selectList(pi);
		
		// 근무현황 조회
		int cEmpNo = loginEmp.getEmpNo();
		//System.out.println("cEmpNo : " + cEmpNo);
		Commute empCommute = cService.selectEmpCommute(cEmpNo);
		//System.out.println("empCoummute: " + empCommute);
		// 공지사항 확인
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("empCommute", empCommute)
		  .addObject("loginEmp", loginEmp)
		  .setViewName("main");
		
		return mv;
			
	}
	
	@RequestMapping("findPwd.emp")
	public String findPassword() {
		
		return "common/findPwd";
		
	}
	
	

}
