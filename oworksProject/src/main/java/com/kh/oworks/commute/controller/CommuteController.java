package com.kh.oworks.commute.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String offList(HttpSession session, Employee e, Model model) {
		
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		ArrayList<Commute> offList = cService.offList(loginEmp.getEmpNo());
		
		model.addAttribute("empNo", loginEmp.getEmpNo())
			 .addAttribute("offList", offList);
		return "commute/offListView";
		
	}
	
	// 사용자 인사관리_근무현황
	@RequestMapping("list.at")
	public ModelAndView adList(HttpSession session, HttpServletRequest request, ModelAndView mv) {
		
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		int empNo = loginEmp.getEmpNo();
		//System.out.println("empNo:" + empNo);
		
		String condition = "where 1=1";
		//String workDate = request.getParameter("workDate");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		if (start == null)
			System.out.println("시작");
			// start를 이번주 시작으로 세팅
		if (end == null)
			System.out.println("끝");
			//end를 이번주 끝으로 세팅
//		if(workDate != null) {
//			Date time = new Date();
//			SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
//			workDate = format.format(time);
//		}
		if(start != null && end != null) {
			condition += (" and work_date between '" + start + "' and '" + end + "'");
		}
		if(empNo != 0) {
			condition += (" and emp_no = '" + empNo + "'");
		}
		System.out.println("condition: " + condition);
		
		ArrayList<Commute> adList = cService.adList(condition);
		System.out.println("adList : " + adList);
		
		mv.addObject("adList", adList)
		  .setViewName("commute/attendanceListView");
		return mv;
		
	}
	
	//사용자 인사관리_휴가관리 신청서 보기
	@RequestMapping("enroll.off")
	public String offEnroll() {
		return "commute/offRequest";
	}
	
	//사용자 인사관리_휴가관리_신청서작성
	@RequestMapping("insert.off")
	public String insertOff(Commute c, HttpSession session, Model model) {
		//System.out.println("offStart" + c.getOffEnd().compareTo(c.getOffStart()));
		c.setOffUsed(c.getOffEnd().compareTo(c.getOffStart()));
		int result = cService.insertOff(c);
		System.out.println(result);
		if(result > 0) {
			session.setAttribute("alertMsg", "휴가 신청이 완료되었습니다.");
			return "redirect:list.off";
		}else {
			session.setAttribute("alertMsg", "휴가 신청에 실패하였습니다.");
			return "redirect/";
		}
		
	}
	
	//메인 출근 기록
	@RequestMapping("insertEmpIn")
	public String insertEmpIn(Commute c, HttpSession session, Model model) {
	
		int result = cService.insertEmpIn(c.getEmpNo());
		if (result > 0)
			return "redirect:/login.emp";
		else
			return null;
	}
	
	// 메인 퇴근 기록
	@RequestMapping("updateEmpOut")
	public String updateEmpOut(Commute c, HttpSession session, Model model) {
		
		int result = cService.updateEmpOut(c.getEmpNo());
		if (result > 0)
			return "redirect:/login.emp";
		else
			return null;
				
	}

	
}
