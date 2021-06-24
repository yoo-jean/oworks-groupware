package com.kh.oworks.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.oworks.board.model.service.FreeBoardService;
import com.kh.oworks.board.model.vo.FreeBoard;
import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.common.template.Pagination;

@Controller
public class FreeBoardController {

	@Autowired
	private FreeBoardService fbService;
	
	// 게시글 전체 조회
	@RequestMapping("list.fb")
	public ModelAndView selectFreeBoardList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = fbService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<FreeBoard> list = fbService.selectList(pi);
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/freeBoardListView");
		
		return mv;
	}
	
	
	// 게시글 상세보기
	@RequestMapping("detail.fb")
	public String selectFreeBoard(int fbno, HttpSession session, Model model) {
		
		int result = fbService.increaseCount(fbno);
		
		if(result>0) {
			FreeBoard fb = fbService.selectFreeBoard(fbno);
			model.addAttribute("fb", fb);
			return "board/freeBoardDetailView";
			
		}else {
			model.addAttribute("errorMsg", "게시글 조회 실패!");
			return "common/errorPage";
	
		}
		
	}	
	
	// 게시글 작성하기 페이지 이동
	@RequestMapping("enrollForm.fb")
	public String enrollForm() {
		return "board/freeBoardEnrollForm";
	}
	
	
	
	
	
}
