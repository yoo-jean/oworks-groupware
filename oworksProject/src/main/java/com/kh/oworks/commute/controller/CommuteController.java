package com.kh.oworks.commute.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.oworks.commute.model.service.CommuteService;
import com.kh.oworks.commute.model.vo.Commute;
import com.kh.oworks.employee.model.vo.Employee;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService cService;
	
	//사용자 인사관리_휴가관리
	@RequestMapping("list.off")
	public ModelAndView offList(ModelAndView mv, HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		int empNo = loginEmp.getEmpNo();
		//System.out.println("empNo:" + empNo);
		ArrayList<Commute> offList = cService.offList(empNo);
		
		mv.addObject("offList", offList)
		  .setViewName("commute/offListView");
		return mv;
		
	}
	
	// 사용자 인사관리_근무현황
	@RequestMapping("list.ad")
	public ModelAndView adList(ModelAndView mv, HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		int empNo = loginEmp.getEmpNo();
		System.out.println("empNo:" + empNo);
		ArrayList<Commute> adList = cService.adList(empNo);
		
		mv.addObject("adList", adList)
		  .setViewName("commute/attendanceListView");
		return mv;
		
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
	
	//메인 출근 기록
	@RequestMapping("empIn")
	public String empIn(Commute c, HttpSession session, Model model) {
		
		int result = cService.empIn(c.getEmpNo());
		System.out.println(result);
		
		if(result > 0) {
			String startTime = cService.selectEmpIn(c.getEmpNo());
			model.addAttribute("startTime", startTime);
			return "main";
		}else {
			return "redirect:/";
		}
		
	}
	
	// 메인 출근 조회
	/*@RequestMapping("selectEmpIn")
	public String selectEmpIn(int empNo, Model model) {
		
		String selectStartTime = cService.selectEmpIn(empNo);
		
		model.addAttribute("selectStartTime", selectStartTime);
		return "main";
		
	}*/
	
}
