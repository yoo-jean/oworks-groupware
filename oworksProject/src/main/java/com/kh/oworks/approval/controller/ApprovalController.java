package com.kh.oworks.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		
		int listCount = appService.selectListCount(al);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		System.out.println(pi);
		
		//대기문서
		ArrayList<ApprovalLine> waitList = appService.selectWaitList(pi, al);
		//System.out.println(waitList);
		
		//진행문서
		ArrayList<ApprovalLine> list = appService.selectList(pi, al);
		//System.out.println(list);
		
		//완료문서
		ArrayList<ApprovalLine> finishList = appService.selectFinishList(pi, al);
		//System.out.println(finishList);
		
		model.addAttribute("pi", pi);
		model.addAttribute("waitList", waitList);
		model.addAttribute("list", list);
		model.addAttribute("finishList", finishList);
		
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
	
	/*전자결재 수정하기 페이지 이동(임시저장페이지에서)*/
	@RequestMapping("updateForm.ap")
	public String updateForm(String ano, Model model) {
		Approval a = appService.selectApproval(ano);
		model.addAttribute("a", a);
		//model.addAttribute("a", appService.selectApproval(ano));
		return "approval/approvalUpdate";
	}
	
	/*전자결재 수정하기(임시저장페이지에서)*/
	@RequestMapping("updateSave.ap")
	public String updateSaveApproval(HttpServletRequest request, Approval a, ApprovalLine al, FilePath fp, MultipartFile reupfile, HttpSession session, Model model) {
		
		ArrayList<ApprovalLine> apLineList = al.getLineList();
		//System.out.println(apLineList);
		
		//첨부파일
		if(!reupfile.getOriginalFilename().equals("")) { // 첨부파일이 존재하는 경우
			
			String changeName = saveFile(session, reupfile);
			
			fp.setOrgFileName(reupfile.getOriginalFilename());
			fp.setMdfFileName("resources/uploadFiles/" + changeName);
			fp.setFilePath("resources/uploadFiles/");
		}
		
		// 기안서
		int result = appService.updateSaveApproval(a);

		// 결재선
		int apLineResult = appService.updateAddLine(apLineList);
		
		
		if(result>0) {
			session.setAttribute("alertMsg", "기안이 성공적으로 완료되었습니다");
			return "redirect:detail.ap?ano=" + a.getAppNo();
		}else {
			model.addAttribute("errorMsg", "기안작성에 실패했습니다. 다시 시도해주세요");
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
	public String insertApproval(@RequestParam("empNo")int empNo, HttpServletRequest request, Approval a, ApprovalLine al, FilePath fp, MultipartFile upfile, HttpSession session, Model model) {
		
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
		// 참조
		//int referLine = appService.insertReferLine(apLineList);
		
		
		if(result>0) {
			session.setAttribute("alertMsg", "기안등록이 완료되었습니다");
			return "redirect:list.ap";
		}else {
			model.addAttribute("errorMsg", "기안등록실패");
			return "common/errorPage";
		}
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
	public String updateApproval(Approval a, ApprovalLine al, HttpSession session, Model model) {
		
		int result = appService.updateApproval(al);
		
		int status = appService.updateApprovalStatus(a);
		
		int lineStatus = appService.updateApprovalLineStatus(al);
		
		//int lineStatus = appService.updateLineStatus(al);
		// 결재자 몇명인지 알기 위해 필요
		//ArrayList<ApprovalLine> appLine = appService.selectApprovalLine(ano); 
		
		if(result>0) {
			session.setAttribute("alertMsg", "결재가 완료되었습니다");
			return "redirect:detail.ap?ano=" + al.getAppNo();
		}else {
			model.addAttribute("errorMsg", "결재를 실패했습니다. 다시 시도해주세요");
			return "common/errorPage";
		}
	}
	
	/*임시저장
	@RequestMapping("save.ap")
	public String saveApproval(HttpServletRequest request, Approval a, ApprovalLine al, FilePath fp, MultipartFile upfile, HttpSession session, Model model) {
		
		ArrayList<ApprovalLine> apLineList = al.getLineList();
		//System.out.println(apLineList);
		
		// 첨부파일
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
		// 참조
		//int referLine = appService.insertReferLine(apLineList);
		
		
		if(result>0) {
			session.setAttribute("alertMsg", "기안등록이 완료되었습니다");
			return "redirect:list.ap";
		}else {
			model.addAttribute("errorMsg", "기안등록실패");
			return "common/errorPage";
		}
	}
	*/
	
	
	/*임시저장 페이지로 이동*/
	@RequestMapping("saveList.ap")
	public String selectSaveList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Approval a, ApprovalLine al, HttpSession session, Model model) {
		
		int listCount = appService.selectSaveListCount(a);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		
		ArrayList<Approval> saveList = appService.selectSaveList(pi, a);
		
		model.addAttribute("pi", pi);
		model.addAttribute("saveList", saveList);
		
		return "approval/approvalSave";
	}
	
	
	// 임시저장 검색하기
	@RequestMapping("search.ap")
	public String searchApproval(HttpServletRequest request, HttpServletResponse response, Approval a)throws ServletException, IOException{
		
		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");
		String empNo = request.getParameter("empNo");
		
		//int empNo = a.getEmpNo();
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("empNo", empNo);
		
		// 검색 조건에 만족하는 게시글 총 개수
		int searchCount = appService.selectSearchListCount(map);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, 10);
		ArrayList<Approval> saveList = appService.selectSearchList(map, pi);
		//System.out.println(saveList);
		
		
		request.setAttribute("pi", pi);
		request.setAttribute("saveList", saveList);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("empNo", empNo);
		
		return "approval/approvalSave";
		
		
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
	
	
	/*대기페이지로 이동*/
	@RequestMapping("wait.ap")
	public String waitApproval(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Approval a, ApprovalLine al, HttpSession session, Model model) {
		
		int listCount = appService.selectListCount(al);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		//대기문서
		ArrayList<ApprovalLine> waitList = appService.selectWaitList(pi, al);
		System.out.println(waitList);
		
		model.addAttribute("pi", pi);
		model.addAttribute("waitList", waitList);
		
		return "approval/approvalWait";
	}
	
	/*진행페이지로 이동*/
	@RequestMapping(value="progress.ap")
	public String selectList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Approval a, ApprovalLine al, HttpSession session, Model model) {	
		
		int listCount = appService.selectListCount(al);
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		System.out.println(pi);
		//진행문서
		ArrayList<ApprovalLine> list = appService.selectList(pi, al);
		//System.out.println(list);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "approval/approvalProgress";
		
	}
	
	/*완료페이지로 이동*/
	@RequestMapping("complete.ap")
	public String selectFinishList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Approval a, ApprovalLine al, HttpSession session, Model model) {
		
		int listCount = appService.selectListCount(al);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		//완료문서
		ArrayList<ApprovalLine> finishList = appService.selectFinishList(pi, al);
		//System.out.println(finishList);
		model.addAttribute("pi", pi);
		model.addAttribute("finishList", finishList);
		
		return "approval/approvalComplete";
	}
	
	/*[대기]결재문서 상태에 따른 검색*/
	@RequestMapping("waitSearch.ap")
	public String searchApprovalWait(HttpServletRequest request, HttpServletResponse response, ApprovalLine al)throws ServletException, IOException{
		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");
		String empName = request.getParameter("empName");
		String status = request.getParameter("status");
		String empNo = request.getParameter("empNo");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("empName", empName);
		map.put("status", status);
		map.put("empNo", empNo);
		
		
		int searchCount = appService.selectSearchCount(map);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
		ArrayList<ApprovalLine> waitList = appService.selectSearchListState(map, pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("waitList", waitList);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("empName", empName);
		request.setAttribute("status", status);
		
		// return 조건문 못주나?
		//return "approval/approvalWait";
		return "approval/approvalWait";
	}
	
	/*[진행]결재문서 상태에 따른 검색*/
	@RequestMapping("approvalSearch.ap")
	public String searchApprovalState(HttpServletRequest request, HttpServletResponse response, ApprovalLine al)throws ServletException, IOException{
		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");
		String empName = request.getParameter("empName");
		String status = request.getParameter("status");
		String empNo = request.getParameter("empNo");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("empName", empName);
		map.put("status", status);
		map.put("empNo", empNo);
		
		
		int searchCount = appService.selectSearchCount(map);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
		ArrayList<ApprovalLine> list = appService.selectSearchListState(map, pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("empName", empName);
		request.setAttribute("status", status);
		
		// return 조건문 못주나?
		return "approval/approvalProgress";
	}
	
	
	/*[완료]결재문서 상태에 따른 검색*/
	@RequestMapping("completeSearch.ap")
	public String searchApprovalComplete(HttpServletRequest request, HttpServletResponse response, ApprovalLine al)throws ServletException, IOException{
		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");
		String empName = request.getParameter("empName");
		String status = request.getParameter("status");
		String empNo = request.getParameter("empNo");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("empName", empName);
		map.put("status", status);
		map.put("empNo", empNo);
		
		
		int searchCount = appService.selectSearchCount(map);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
		ArrayList<ApprovalLine> finishList = appService.selectSearchListState(map, pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("finishList", finishList);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("empName", empName);
		request.setAttribute("status", status);
		
		// return 조건문 못주나?
		return "approval/approvalComplete";
		
	}
	
	/* 전자결재 회수하기*/
	@RequestMapping("collectApproval.ap")
	public String collectApproval(String ano, String filePath, HttpSession session, Model model) {
		
		// 결재테이블에서 회수로 바꾸기
		int result = appService.collectApproval(ano);
		
		// 결재선 테이블에서 회수로 바꾸기
		int status = appService.changeStatus(ano);
		
		if(result>0) {
			//첨부파일 있었을 경우
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			
			session.setAttribute("alertMsg", "성공적으로 기안취소가 완료되었습니다");
			return "redirect:list.ap";
		
		}else {
			model.addAttribute("erroeMsg", "기안취소를 실패하였습니다. 다시 시도해주세요");
			return "common/errorPage";
		}
		
	}
	
}
