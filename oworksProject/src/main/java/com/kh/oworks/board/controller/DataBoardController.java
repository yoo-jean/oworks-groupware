package com.kh.oworks.board.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.oworks.board.model.service.DataBoardService;
import com.kh.oworks.board.model.vo.DataBoard;
import com.kh.oworks.board.model.vo.DataFile;
import com.kh.oworks.board.model.vo.Like;
import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.common.template.Pagination;

@Controller
public class DataBoardController {
	
	
	@Autowired
	private DataBoardService dService;
	
	
	// 자료실 전체 조회
	@RequestMapping("list.db")
	public String selectDataBoardList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = dService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<DataBoard> list = dService.selectDataBoardList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "board/dataBoardListView";
		
	}
	
	
	// 자료실 글 쓰기 폼으로 이동
	@RequestMapping("enrollForm.db")
	public String enrollForm() {
		return "board/dataBoardEnrollForm";
	}
	
	
	// 자료실 글 쓴 거 작성
	@ResponseBody
	@RequestMapping("insert.db")
	public String insertDataBoard(DataBoard db, MultipartFile upfile, HttpSession session, Model model) {
		
		// 전달된 파일이 있을 경우 (파일명 수정 후 업로드)
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(session, upfile);
			
			db.setOriginName(upfile.getOriginalFilename());
			db.setChangeName("resources/uploadFiles/" + changeName);
			
			
		}
		int result = dService.insertDataBoard(db);
		
		
		
		// 성공 페이지
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 게시글 작성되었습니다");
			return "redirect:list.db";
			
		}else {			// 실패 페이지
			model.addAttribute("errorMsg", "게시글 작성 실패!");
			return "common/errorPage";
		}
		
		
		
	}
	
	
	@RequestMapping("detail.db")
	public String selectDataBoard(int dbno, Model model) {
		int result = dService.increaseCount(dbno);	// 조회수 증가 (update문 int)
		
		if(result > 0) {
			DataBoard db = dService.selectDataBoard(dbno);
			
			model.addAttribute("b", db);
			return "board/dataBoardDetailView";
			
		}else {
			model.addAttribute("errorMsg", "게시글 상세 조회 실패");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping("delete.db")
	public String deleteDataBoard(int dbno, String filePath, HttpSession session, Model model) {
		 
		int result = dService.deleteDataBoard(dbno);
		
		if(result > 0) {
			
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다!");
			return "redirect:list.db";
			
		}else {
			
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping("updateForm.db")
	public String updateForm(int dbno, Model model) {
		
		//DataBoard db = dService.selectDataBoard(boardNo);
		//model.addAttribute("db", db);
		model.addAttribute("b", dService.selectDataBoard(dbno));
		return "board/dataBoardUpdateForm";
	}
	
	
	@RequestMapping("update.db")
	public String updateDataBoard(DataBoard b, MultipartFile reupfile, HttpSession session, Model model) {
		
		if(!reupfile.getOriginalFilename().equals("")) {	// 새로 넘어온 첨부파일이 있음
			
			if(b.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(b.getChangeName())).delete();
			}
			
			String changeName = saveFile(session, reupfile);
			b.setOriginName(reupfile.getOriginalFilename());
			b.setChangeName("resources/uploadFiles/" + changeName);
		}
		
		int result = dService.updateDataBoard(b);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글이 성공적으로 수정되었습니다");
			return "redirect:detail.db?dbno=" + b.getBoardNo();
		}else {
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
	} 

	
	
	
	
	
	
	
	
	
	
	// 전달받은 첨부파일 수정명 작업해서 서버에서 업로드 시키는 메소드 (+ 수정명 반환까지)
	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		String originName = upfile.getOriginalFilename(); // 원본명
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random()* 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext; // 수정명
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
