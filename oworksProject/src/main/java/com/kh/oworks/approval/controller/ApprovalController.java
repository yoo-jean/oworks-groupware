package com.kh.oworks.approval.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.oworks.approval.model.service.ApprovalService;
import com.kh.oworks.approval.model.vo.Approval;
import com.kh.oworks.approval.model.vo.ApprovalComment;
import com.kh.oworks.approval.model.vo.ApprovalLine;
import com.kh.oworks.approval.model.vo.FilePath;
import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.common.template.Pagination;
import com.kh.oworks.employee.model.vo.Employee;
import com.sun.xml.internal.ws.api.message.Attachment;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService appService;
	
	/*전자결제 메인 조회*/
	
	@RequestMapping("list.ap")
	public String selectApprovalList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Approval a, ApprovalLine al, HttpSession session, Model model) {
		
		int listCount = appService.selectListCount(a);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		
		ArrayList<Approval> list = appService.selectList(pi, a);
		
		//System.out.println(list);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "approval/approvalMain";
	}
	
	
	
	/*전자결재 상세보기*/
	@RequestMapping("detail.ap")
	public String selectApproval(String ano, Model model) {
		
		//int result = appService.increaseCount(ano);
		
		Approval a = appService.selectApproval(ano);
		ArrayList<ApprovalLine> appLine = appService.selectApprovalLine(ano); 
		ArrayList<Attachment> attList = appService.selectAttachment(ano);
		
		if(!"".equals(a)) {
			model.addAttribute("appLine", appLine);
			model.addAttribute("attList", attList);
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
	

	/*기안서 문서양식(품의서) 작성하기 페이지 이동*/
	@RequestMapping("enrollForm.ap")
	public String enrollForm() {
		return "approval/approvalWrite";
	}
	
	
	/*기안서 작성하기*/
	@RequestMapping("insert.ap")
	public String insertApproval(HttpServletRequest request, Approval a, ApprovalLine al, FilePath fp, MultipartFile upfile, HttpSession session, Model model) {
		
		//ArrayList<ApprovalLine> llist = new ArrayList<ApprovalLine>();
		//ArrayList lineList = new ArrayList();
		//lineList.add(a.getLineList());
		//System.out.println(lineList);
		
		// System.out.println(Line);
		
		// 결재선 이것저것
		// List<ApprovalLine> list = new ArrayList<ApprovalLine>();
		// Map<String, Object> map = new HashMap<String, Object>();
		//map.put("list", list);
		/*
		HashMap Line = new HashMap();
		Line.put("empNo", list);
		Line.put("apporder", 0);
		Line.put("refer", "결재");
		Line.put("appstatus", "대기");
		*/
		
		ArrayList<ApprovalLine> apLineList = al.getLineList();
		//System.out.println(apLineList);
		
		//첨부파일
		if(!upfile.getOriginalFilename().equals("")) { // 첨부파일이 존재하는 경우
			
			String changeName = saveFile(session, upfile);
			
			fp.setOrgFileName(upfile.getOriginalFilename());
			fp.setMdfFileName("resources/uploadFiles/" + changeName);
			fp.setFilePath("resources/uploadFiles/");
		}
		
		// 기안서
		int result = appService.insertApproval(a);
		// 첨부파일
		int result2= appService.insertFilePath(fp);
		// 결재선
		int apLineResult = appService.insertAddLine(apLineList);
		
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
	
	
	/*승인, 반려 버튼 클릭시 update*/
	// approvalLine에 있는 status 대기-> 진행 -> 완료 되게끔
	@RequestMapping(value="update.ap")
	public String updateApproval(ApprovalLine al, HttpSession session, Model model) {
		int result = appService.updateApproval(al);
		
		if(result>0) {
			session.setAttribute("alertMsg", "결재가 완료되었습니다");
			return "redirect:detail.ap?ano=" + al.getAppNo();
		}else {
			model.addAttribute("errorMsg", "결재를 실패했습니다. 다시 시도해주세요");
			return "common/errorPage";
		}
	}
	

}
