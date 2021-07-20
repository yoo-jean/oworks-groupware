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
		System.out.println("loginEmp:"+loginEmp);
		session.setAttribute("loginEmp", loginEmp);
		// 위결과(empNo=10005, deptCode=D4, deptName=기획부, jobCode=J2, jobName=부장, empName=방명수, empId=emp05, empPwd=1234, birthNo=631156-1548657, gender=M, email=emp05@oworks.com, phone=010-1111-2226, empPhone=1005, address=서울시 강남구, hireDate=2010-05-04, retireDate=null, empStatus=Y, empImage=resources/images/empUser.png, offGiven=20, offAvailable=13, adminYn=N)
		// 메인화면에서 공지사항 확인
		int listCount = nService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Notice> list = nService.selectList(pi);
		// 출근시간 조회
		//String startTime = cService.selectEmpIn(e.getEmpId());
		
		// 근무현황 조회
		int cEmpNo = loginEmp.getEmpNo();
		System.out.println("emp컨트롤러 : " + cEmpNo);
		Commute empCommute = cService.selectEmpCommute(cEmpNo);
		System.out.println("지우가 개키우면 지우개: " + empCommute);
		// 공지사항 확인
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("empCommute", empCommute)
		  .addObject("loginEmp", loginEmp)
		  .setViewName("main");
		//model.addAttribute("c", c);
		  
		return mv;
			
	}
	
	@RequestMapping("findPwd.emp")
	public String findPassword() {
		
		return "common/findPwd";
		
	}
	
	

}
