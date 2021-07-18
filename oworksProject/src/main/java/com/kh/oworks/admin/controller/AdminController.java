package com.kh.oworks.admin.controller;

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

import com.kh.oworks.admin.model.service.AdminService;
import com.kh.oworks.admin.model.vo.Admin;
import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.common.template.Pagination;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	//관리자 근무관리_근태 조회
	@RequestMapping("adList.at")
	public ModelAndView adminAttendanceList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = aService.selectEmpCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Admin> atList = aService.selectAdList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", atList)
		  .setViewName("admin/adminAttendanceListView");
		
		return mv;
		
	}
	
	//관리자 근무관리_근태_일일출퇴근현황 조회
	@RequestMapping("adDailyList.at")
	public ModelAndView adminDailyAttendanceList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, HttpServletRequest request, ModelAndView mv) {
		
		String workDate = request.getParameter("workDate");
		
		int listCount = aService.selectAdCount(workDate);
		System.out.println("listCount: " + listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		if(workDate == null) {
			Date time = new Date();
			SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd");
			workDate = format.format(time);
		}
		System.out.println("workDate: " + workDate);
		
		ArrayList<Admin> list = aService.selectList(pi, workDate);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("baseDate", workDate)
		  .setViewName("admin/adminDailyAttendanceListView");
		
		return mv;
	}
	
	//관리자 근무관리_휴가현황 조회
	@RequestMapping("adList.off")
	public ModelAndView adminOffList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, HttpServletRequest request, ModelAndView mv) {
		
		int listCount = aService.selectOffCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		String condition = "where 1=1 ";
		
		String offStart = request.getParameter("offStart");
		String hireDate = request.getParameter("hireDate");
		String empName = request.getParameter("empName");
		//System.out.println("휴가일" + offStart + "입사일" + hireDate + "사원명" + empName);
		
		if(offStart != null && offStart.length() > 0) {
			condition += ("and to_date(off_start, 'YY-MM-DD') = to_date('" + offStart + "', 'YY-MM-DD')");
		}
		if(hireDate != null && hireDate.length() > 0) {
			if (hireDate.equals("1")); // whole
			else if (hireDate.equals("2")) 
				condition += ("and to_date(sysdate, 'YYYY-MM-DD') - to_date(hire_date, 'YYYY-MM-DD') < 365");
			else
				condition += ("and to_date(sysdate, 'YYYY-MM-DD') - to_date(hire_date, 'YYYY-MM-DD') >= 365");
		}
		if(empName != null && empName.length() > 0) {
			condition += ("and emp_name = '" + empName + "'");
		}
		//System.out.println("whereString: " + condition);

		ArrayList<Admin> offList = aService.selectOffList(pi, condition);
		
		mv.addObject("pi", pi)
		  .addObject("offList", offList)
		  .setViewName("admin/adminOffListView");
		
		return mv;
	}
	/*@RequestMapping("adList.off")
	public String adminOffList() {
		return "admin/adminOffListView";
	}*/
	
	//관리자 근무관리_휴가_휴가분류 조회
	@RequestMapping("adCate.off")
	public ModelAndView adminOffCate(ModelAndView mv) {
		ArrayList<Admin> offCate = aService.selectOffCate();
		
		mv.addObject("offCate", offCate)
		  .setViewName("admin/adminOffCate");
		return mv;
	}
	
	//관리자 근무관리_휴가분류관리 insert
	@RequestMapping("insertCate.of")
	public String insertOffCate(Admin a, HttpSession session, Model model) {
		
		int result = aService.insertOffCate(a);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 추가 되었습니다.");
			return "redirect:adCate.off";
		}else {
			model.addAttribute("errorMsg", "추가에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	//alertify.alert('제목', '메세지내용');
	
	//관리자 근무관리_휴가분류관리 delete
	@RequestMapping
	public String deleteOffCate(int offCateNo, HttpSession session, Model model) {
		
		int result = aService.deleteOffCate(offCateNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 삭제하였습니다.");
			return "redirect:adCate.off";
		}else {
			model.addAttribute("errorMsg", "삭제에 실패하였습니다.");
			return "common/errorPage";
		}
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
