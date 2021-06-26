package com.kh.oworks.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oworks.employee.model.service.EmployeeService;
import com.kh.oworks.employee.model.vo.Employee;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService eService;
	
	@RequestMapping("login.emp")
	public String loginEmployee(Employee e, HttpSession session) {
		
		Employee loginEmp = eService.loginEmployee(e);
		
		if(loginEmp == null) {
			System.out.println("로그인 실패");
			session.setAttribute("alertMsg", "로그인을 실패하였습니다. 아이디와 비밀번호를 확인해주세요.");
			return "redirect:/";
		}else {
			System.out.println("로그인 성공");
			// System.out.println(loginEmp.getJobCode()); 'join 확인'
			return "main";
			
		}
		
	}
	
	
	
	@RequestMapping("findPwd.emp")
	public String findPassword() {
		
		return "common/findPwd";
	}
	
	
	

}
