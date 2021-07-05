package com.kh.oworks.address.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.oworks.address.model.service.AddressService;
import com.kh.oworks.address.model.vo.Address;
import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.common.template.Pagination;

@Controller
public class AddressController {
	
	@Autowired
	private AddressService aService;
	
	
	// 전체 조회
	@RequestMapping("list.ai")
	public String selectDataBoardList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = aService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Address> list = aService.selectAddressList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "address/addressIn";
		
	}
	
	// insert
	@RequestMapping("insert.ai")
	public String insertAddress(int submitEmpNo, HttpSession session, Model model) {
		int result = aService.insertAddress(submitEmpNo);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 게시글 작성되었습니다");
			return "redirect:list.ai";
			
		}else {			// 실패 페이지
			model.addAttribute("errorMsg", "게시글 작성 실패!");
			return "common/errorPage";

		}
	}
	
	
	//delete
	@RequestMapping("delete.ai")
	public String deleteAddress(int empNo, HttpSession session, Model model) {
		int result = aService.deleteAddress(empNo);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 게시글 작성되었습니다");
			return "redirect:list.ai";
			
		}else {			// 실패 페이지
			model.addAttribute("errorMsg", "게시글 작성 실패!");
			
			return "common/errorPage";

		}
	}
	
	
	
	
	

}
