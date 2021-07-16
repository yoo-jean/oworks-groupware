package com.kh.oworks.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.oworks.board.model.vo.Like;
import com.kh.oworks.board.model.vo.Notice;
import com.kh.oworks.common.model.vo.PageInfo;

public interface NoticeService {
	// 게시판 리스트 조회 (페이징 처리)
	int selectListCount();
	ArrayList<Notice> selectList(PageInfo pi);
	
	// 게시판 작성
	int insertNotice(Notice n);
	
	// 게시판 상세보기
	int increaseCount(int noticeNo);
	Notice selectNotice(int noticeNo);
	
	// 게시판 수정
	int updateNotice(Notice n);
	
	// 게시판 삭제
	int deleteNotice(int noticeNo);
	
	// 게시판 검색 리스트 조회
	int selectSearchListCount(HashMap<String, String> map);
	ArrayList<Notice> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	// 게시글 좋아요 count
	int likeCount(Like li);
	
	// 게시글 좋아요
	int insertLike(Like l);
	
	// 게시글 좋아요 취소
	int deleteLike(Like l);
	
	// 전체 좋아요 개수
	ArrayList<Like> selectLikeCount(int noiceNo);
}
