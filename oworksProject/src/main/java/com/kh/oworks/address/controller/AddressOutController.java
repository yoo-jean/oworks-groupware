package com.kh.oworks.address.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.oworks.address.model.service.AddressOutService;
import com.kh.oworks.address.model.vo.AddressOut;
import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.common.template.Pagination;

@Controller
public class AddressOutController {
	
	@Autowired
	private AddressOutService oService;
	
	
	// 전체 조회
	@RequestMapping("list.ao")
	public String selectAddressOutList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = oService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<AddressOut> list = oService.selectAddressOutList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "address/addressOut";
		
	}
	
	
	// insert
	@RequestMapping("insert.ao")
	public String insertAddressOut(AddressOut ao, HttpSession session, Model model) {
		int result = oService.insertAddressOut(ao);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다");
			return "redirect:list.ao";
			
		}else {			// 실패 페이지
			model.addAttribute("errorMsg", "등록 실패!");
			return "common/errorPage";

		}
	}
	
	
	// delete
	@RequestMapping("delete.ao")
	public String deleteAddressOut(int addOutNo, HttpSession session, Model model) {
		int result = oService.deleteAddressOut(addOutNo);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다");
			return "redirect:list.ao";
			
		}else {			// 실패 페이지
			model.addAttribute("errorMsg", "삭제 실패!");
			return "common/errorPage";

		}
	}
	
	
	// update
	@RequestMapping("update.ao")
	public String updateAddressOut(AddressOut ao, HttpSession session, Model model) {
		int result = oService.updateAddressOut(ao);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다");
			return "redirect:list.ao";
			
		}else {			// 실패 페이지
			model.addAttribute("errorMsg", "수정 실패!");
			return "common/errorPage";

		}
	}
	
	

}
