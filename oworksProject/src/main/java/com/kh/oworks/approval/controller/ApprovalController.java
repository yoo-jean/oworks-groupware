package com.kh.oworks.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.oworks.approval.model.service.ApprovalService;
import com.kh.oworks.approval.model.vo.Approval;
import com.kh.oworks.approval.model.vo.ApprovalComment;
import com.kh.oworks.approval.model.vo.ApprovalForm;
import com.kh.oworks.approval.model.vo.ApprovalLine;
import com.kh.oworks.approval.model.vo.FilePath;
import com.kh.oworks.employee.model.vo.Employee;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService appService;
	
	/*전자결재 메인페이지 이동 로그인 기능 생기면 쓸거*/
	/*
	@RequestMapping("list.ap")
	public ModelAndView selectApprovalList(ModelAndView mv, int empNo) {
		
		int listCount = appService.selectListCount();
		//PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 20);
		
		ArrayList<Approval> list = appService.selectList(empNo);
		
		//mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("approval/approvalMain");
		
		return mv;
	}
	*/
	
	/*전자결재 메인페이지 이동 로그인 기능 생기면 지우기*/
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
	
	/*전자결재 상세보기*/
	@RequestMapping("detail.ap")
	public String selectApproval(String ano, Model model) {
		
		int result = appService.increaseCount(ano);
		
		if(result>0) {
			Approval a = appService.selectApproval(ano);
			model.addAttribute("a", a);
			//System.out.println(a);
			return "approval/approvalDetailView";
			
		}else {
			model.addAttribute("errorMsg", "전자결재 조회 실패!");
			return "common/errorPage";
		}
	}
	
	/*기안서에 달린 코멘트 리스트 조회*/
	@ResponseBody
	@RequestMapping(value="clist.ap", produces="application/json; charset=utf-8")
	public String ajaxSelectCommentList(String ano) {
		ArrayList<ApprovalComment> list = appService.selectCommentList(ano);
		//System.out.println(ano);
		return new Gson().toJson(list);
	}
	
	/*기안서에 코멘트 작성하기*/
	@ResponseBody
	@RequestMapping("cinsert.ap")
	public String ajaxInsertComment(ApprovalComment ac) {
		int result = appService.insertComment(ac);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	/*기안서 문서양 선택 페이지 이동*/
	@RequestMapping("selectForm.ap")
	public String selectForm() {
		return "approval/approvalFormSelect";
	}
	
	
	/*기안서 문서양식(품의서) 작성하기 페이지 이동*/
	@RequestMapping("enrollForm.ap")
	public String enrollForm() {
		return "approval/approvalWrite";
	}
	/*기안서 문서양식(지출결의서) 페이지 이동*/
	@RequestMapping("disbursement.ap")
	public String disbursement() {
		return "approval/disbursementWrite";
	}
	
	/*기안서 문서양식(경력증명서) 페이지 이동*/
	@RequestMapping("certificate.ap")
	public String certificate() {
		return "approval/certificateWrite";
	}
	
	/*기안서 작성하기*/
	@RequestMapping("insert.ap")
	public String insertApproval(Approval a, FilePath fp, MultipartFile upfile, HttpSession session, Model model) {
		
		ArrayList<ApprovalLine> llist = new ArrayList<ApprovalLine>();
		if(!upfile.getOriginalFilename().equals("")) { // 첨부파일이 존재하는 경우
			
			String changeName = saveFile(session, upfile);
			
			fp.setOrgFileName(upfile.getOriginalFilename());
			fp.setMdfFileName("resources/uploadFiles/" + changeName);
			fp.setFilePath("resources/uploadFiles/");
		}
		
		int result = appService.insertApproval(a, fp, llist);
		
		if(result>0) {
			session.setAttribute("alertMsg", "기안등록이 완료되었습니다");
			return "redirect:list.ap";
		}else {
			model.addAttribute("errorMsg", "기안등록실패");
			return "common/errorPage";
		}
	}
	
	/*전달받은 첨부파일 수정명 작업해서 서버에 업로드 시킨 후 해당 수정된 파일명을 반환하는 메소드*/
	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum =(int)(Math.random()*900000+10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	/*결재선 부서원 조회*/
	@ResponseBody
	@RequestMapping(value="dlist.ap", produces="application/json; charset=utf-8")
	public String ajaxSelectDepartmentList() {

		ArrayList<Employee> list = appService.selectDepartmentList();
		return new Gson().toJson(list);
	}
	
	/*기안서 임시저장*/

	

}
