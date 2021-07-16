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

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService appService;
	
	/*전자결제 메인 조회*/
	@RequestMapping("list.ap")
	public String selectApprovalList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Approval a, ApprovalLine al, HttpSession session, Model model) {
		
		int listCount = appService.selectListCount(al);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		//System.out.println(pi);
		
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
		ArrayList<FilePath> attList = appService.selectFilePath(ano);
		// 참조자 보기
		//ArrayList<ApprovalLine> appLineRefer = appService.selectApprovalLineRefer(ano);
		//System.out.println("참조 : " + appLineRefer);
		
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
	public String updateForm(String ano, Model model, HttpServletRequest request) {
		String appNo = request.getParameter("ano");
		Approval a = appService.selectApproval(ano);
		FilePath fp = appService.selectDetailFilePath(ano);
		ArrayList<ApprovalLine> al = appService.selectApprovalLine(ano);
		
		model.addAttribute("a", a);
		model.addAttribute("fp", fp);
		model.addAttribute("al", al);
		System.out.println(al);
		return "approval/approvalUpdate";
	}
	
	/*전자결재 수정하기(임시저장페이지에서)*/
	@RequestMapping("updateSave.ap")
	public String updateSaveApproval(HttpServletRequest request, String appNo, Approval a, ApprovalLine al, FilePath fp, MultipartFile reupfile, HttpSession session, Model model) {
		
		
		String ano = request.getParameter(appNo);
		ArrayList<ApprovalLine> apLineList = al.getLineList();
		System.out.println("apLineList : " + apLineList);
		
		/*첨부파일*/
		if(!reupfile.getOriginalFilename().equals("")) { // 새로 넘어온 첨부파일이 있을 경우
			// 새로 넘어온 첨부파일있는데 기존의 첨부파일이 있었을 경우 => 서버에 업로드 되어있는 기존의 파일 찾아서 지울꺼임
			if(fp.getMdfFileName() != null) {
				new File(session.getServletContext().getRealPath(fp.getMdfFileName())).delete();
			}
			
			// 그리고 새로 넘어온 첨부파일 서버에 업로드 시킴
			String changeName = saveFile(session, reupfile);
			fp.setOrgFileName(reupfile.getOriginalFilename());
			fp.setMdfFileName("resources/uploadFiles/" + changeName);
		}
		
		
		// 기안서
		int result = appService.updateSaveApproval(a);
		
		// 첨부파일
		int filePath= appService.updateSaveApprovalFile(fp);
		
		
		// 현재 db에 저장된 결재선 삭제하기
		int apLineDelete = appService.deleteAppLine(appNo);
		System.out.println(apLineDelete);
		// 결재선
		int apLineResult = appService.updateAppLine(apLineList);
		
		model.addAttribute("a", a);
		model.addAttribute("al", al);
		
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
	public String insertApproval(@RequestParam("empNo")int empNo, HttpServletRequest request, Approval a, 
		   ApprovalLine al, FilePath fp, MultipartFile upfile, HttpSession session, Model model) {
		
		System.out.println("작성하기 : " + al);
		ArrayList<ApprovalLine> apLineList = al.getLineList();
		System.out.println(apLineList);
		
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
			model.addAttribute("empNo", empNo);
			model.addAttribute("empName", ((Employee)session.getAttribute("loginEmp")).getEmpName());
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
		
		int lineStatus = appService.updateApprovalLineStatus(a);
		
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
		
		model.addAttribute("empNo", ((Employee)session.getAttribute("loginEmp")).getEmpNo());
		
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
		//System.out.println(waitList);
		
		model.addAttribute("pi", pi);
		model.addAttribute("waitList", waitList);
		
		return "approval/approvalWait";
	}
	
	/*진행페이지로 이동*/
	@RequestMapping(value="progress.ap")
	public String selectList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Approval a, ApprovalLine al, HttpSession session, Model model) {	
		
		int listCount = appService.selectListCount(al);
		//System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		//System.out.println(pi);
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
			model.addAttribute("empNo", ((Employee)session.getAttribute("loginEmp")).getEmpNo());
			model.addAttribute("empName", ((Employee)session.getAttribute("loginEmp")).getEmpName());
			return "redirect:list.ap";
		
		}else {
			model.addAttribute("erroeMsg", "기안취소를 실패하였습니다. 다시 시도해주세요");
			return "common/errorPage";
		}
		
	}
	
	
	/*[관리자] 전체 결재문서 조회*/
	@RequestMapping("allList.ap")
	public String selectApprovalAllList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Approval a, ApprovalLine al, HttpSession session, Model model) {
		
		int listCount = appService.selectAllListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		
		//진행문서
		ArrayList<Approval> list = appService.selectApprovalAllList(pi);
		//System.out.println(list);

		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "approval/approvalAllList";
	}
	
	/*[관리자] 전체문서 키워드 검색*/
	@RequestMapping("allListSearch.ap")
	public String searchAllList(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");
		String deleteStatus = request.getParameter("deleteStatus");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("deleteStatus", deleteStatus);
		
		// 검색 조건에 만족하는 게시글 총 개수
		int searchCount = appService.selectSearchAllListCount(map);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
		ArrayList<Approval> list = appService.selectSearchAllList(map, pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("deleteStatus", deleteStatus);
		
		
		return "approval/approvalAllList";
	}
	
	/*[관리자] 선택 전자결재 삭제하기*/
	@ResponseBody
	@RequestMapping(value="deleteApproval.ap",  produces="application/json; charset=utf-8")
	public void deleteApproval(String[] ano, Approval a, HttpSession session, Model model, HttpServletResponse response, HttpServletRequest request)throws ServletException, IOException {
		
		String[] updateList = request.getParameterValues("ano");
		int size = updateList.length;
		
		for(int i=0; i<size; i++) {
	        System.out.println("appNo : "+updateList[i]);
	    }
		int result = appService.deleteApproval(updateList);
	}
	
	/*[관리자] 전체 삭제된결재문서 조회*/
	@RequestMapping("deleteApprovalList.ap")
	public String deleteApprovalAllList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Approval a, ApprovalLine al, HttpSession session, Model model) {
		int listCount = appService.selectDeleteListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		
		//진행문서
		ArrayList<Approval> list = appService.selectApprovalDeleteList(pi);
		//System.out.println(list);

		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "approval/approvalDeleteList";
	}
	
	/*[관리자] 전자결재 삭제문서 키워드 검색*/
	@RequestMapping("deleteListSearch.ap")
	public String searchDeleteList(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");
		String deleteStatus = request.getParameter("deleteStatus");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("deleteStatus", deleteStatus);
		
		// 검색 조건에 만족하는 게시글 총 개수
		int searchCount = appService.selectSearchAllListCount(map);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
		ArrayList<Approval> list = appService.selectSearchAllList(map, pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("deleteStatus", deleteStatus);
		
		return "approval/approvalDeleteList";
	}
	
	/*[관리자] 선택 전자결재 복구하기*/
	@ResponseBody
	@RequestMapping(value="restore.ap",  produces="application/json; charset=utf-8")
	public void restoreApproval(String[] ano, Approval a, HttpSession session, Model model, HttpServletResponse response, HttpServletRequest request)throws ServletException, IOException {
		
		String[] updateList = request.getParameterValues("ano");
		int size = updateList.length;
		System.out.println(size);
		for(int i=0; i<size; i++) {
	        System.out.println("appNo : "+updateList[i]);
	    }
		int result = appService.restoreApproval(updateList);
	}
}
