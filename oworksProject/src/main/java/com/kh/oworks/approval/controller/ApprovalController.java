package com.kh.oworks.approval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.oworks.approval.model.service.ApprovalService;
import com.kh.oworks.approval.model.vo.Approval;
import com.kh.oworks.employee.model.vo.Employee;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService appService;
	
	/*전자결재 메인페이지 이동*/
	@RequestMapping("list.ap")
	public ModelAndView selectApprovalList(ModelAndView mv) {
		
		int listCount = appService.selectListCount();
		//PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 20);
		
		ArrayList<Approval> list = appService.selectList();
		
		//mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("approval/approvalMain");
		
		return mv;
	}
	
	/*기안서 작성하기 페이지 이동*/
	@RequestMapping("enrollForm.ap")
	public String enrollForm() {
		return "approval/approval";
	}
	
	
	/*결재서 부서원 조회*/
	@ResponseBody
	@RequestMapping(value="dlist.ap", produces="application/json; charset=utf-8")
	public String ajaxSelectDepartmentList() {

		ArrayList<Employee> list = appService.selectDepartmentList();
		return new Gson().toJson(list);
	}
}
