package com.kh.oworks.board.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.oworks.approval.model.service.ApprovalService;
import com.kh.oworks.approval.model.vo.FilePath;
import com.kh.oworks.board.model.service.NoticeService;
import com.kh.oworks.board.model.vo.Notice;
import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.common.template.Pagination;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService nService;
	
	@Autowired
	private ApprovalService appService;
	
	// 게시글 리스트 조회
	
	@RequestMapping("list.no")
	public ModelAndView selectNoticeList(@RequestParam(value="currentPage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		// 게시글 총 개수
		int listCount = nService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Notice> list = nService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/noticeListView");
		
		
		return mv;
		
	}
	
	// 게시글 상세보기
	@RequestMapping("detail.no")
	public String selectNotice(int nno, HttpSession session, Model model) {
		
		int result = nService.increaseCount(nno);
		
		//System.out.println(result);
		
		if(result>0) {
			Notice n = nService.selectNotice(nno);
			model.addAttribute("n", n);
			return "board/noticeDetailView";
			
		}else {
			model.addAttribute("errorMsg", "게시글 조회 실패!");
			return "common/errorPage";
	
		}
		
	}
	
	// 게시글 수정하기 페이지 이동
	@RequestMapping("updateForm.no")
	public String updateForm(int nno, Model model) {
		Notice n = nService.selectNotice(nno);
		model.addAttribute("n", n);
		
		return "board/noticeUpdateForm";
	}
	
	// 게시글 수정하기
	@RequestMapping("update.no")
	public String updateNotice(Notice n, HttpSession session, Model model) {
		
		int result = nService.updateNotice(n);
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글이 성공적으로 수정되었습니다");
			return "redirect:detail.no?nno=" + n.getNoticeNo();
		}else {
			model.addAttribute("errorMsg", "게시글 수정에 실패했습니다!");
			return "common/errorPage";
		}
	}
	
	// 게시글 작성하기 페이지 이동
	@RequestMapping("enrollForm.no")
	public String enrollForm() {
		return "board/noticeEnrollForm";
	}
	
	// 게시글 작성하기
	@RequestMapping("insert.no")
	public String insertNotice(Notice n, HttpSession session, Model model) {
		
		int result = nService.insertNotice(n);
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글이 성공적으로 등록되었습니다");
			return "redirect:list.no";
		}else {
			model.addAttribute("errorMsg", "게시글 등록에 실패했습니다");
			return "common/errorPage";
		}
	}
	
	// 게시글 삭제하기
	@RequestMapping("delete.no")
	public String deleteNotice(int nno, HttpSession session, Model model) {
		
		int result = nService.deleteNotice(nno);
		
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다");
			return "redirect:list.no";
		}else {
			model.addAttribute("errorMsg", "게시글을 삭제하는데 실패했습니다");
			return "common/errorPage";
		}
	}
	
	
	// 게시글 검색하기
	
	@RequestMapping("search.no")
	public String searchNotice(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		// 검색 조건에 만족하는 게시글 총 개수
		int searchCount = nService.selectSearchListCount(map);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
		ArrayList<Notice> list = nService.selectSearchList(map, pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		
		return "board/noticeListView";
		
		
	}
	
	
	// 전달받은 첨부파일 수정명 작업해서 서버에 업로드 시킨 후 해당 수정된 파일명을 반환하는 메소드
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
}
