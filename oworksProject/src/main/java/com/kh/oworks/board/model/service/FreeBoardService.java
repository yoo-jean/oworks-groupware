package com.kh.oworks.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.oworks.board.model.vo.FreeBoard;
import com.kh.oworks.board.model.vo.Reply;
import com.kh.oworks.common.model.vo.PageInfo;

public interface FreeBoardService {

		// 자유게시판 리스트 조회(페이징처리)
		int selectListCount();
		ArrayList<FreeBoard> selectList(PageInfo pi);
		
		// 자유게시판 작성
		int insertFreeBoard(FreeBoard fb);
		
		// 자유게시판 상세조회
		int increaseCount(int fbNo);
		FreeBoard selectFreeBoard(int fbNo);
		
		// 자유게시판 수정
		int updateFreeBoard(FreeBoard fb);
		
		// 자유게시판 삭제
		int deleteFreeBoard(int fbNo);
		
		// 해당 자유게시글에 딸린 댓글리스트 조회
		ArrayList<FreeBoard> selectReplyList(int fbNo);
		
		// 댓글 작성
		int insertReply(Reply r);

		// 자유게시판 검색 리스트 조회
		int selectSearchListCount(HashMap<String, String> map);
		ArrayList<FreeBoard> selectSearchList(HashMap<String, String> map, PageInfo pi);
}
