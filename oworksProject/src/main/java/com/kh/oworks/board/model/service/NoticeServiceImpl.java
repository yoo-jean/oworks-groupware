package com.kh.oworks.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oworks.board.model.dao.NoticeDao;
import com.kh.oworks.board.model.vo.Like;
import com.kh.oworks.board.model.vo.Notice;
import com.kh.oworks.common.model.vo.PageInfo;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao nDao;
	
	// 전체게시글 개수
	@Override
	public int selectListCount() {
		return nDao.selectListCount(sqlSession);
	}

	// 전체게시글 조회
	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return nDao.selectList(sqlSession, pi);
	}

	// 게시글 작성하기
	@Override
	public int insertNotice(Notice n) {
		return nDao.insertNotice(sqlSession, n);
	}
	
	// 게시글 상세보기 
	@Override
	public int increaseCount(int noticeNo) {
		return nDao.increaseCount(sqlSession, noticeNo);
	}
	
	// 게시글 상세보기
	@Override
	public Notice selectNotice(int noticeNo) {
		return nDao.selectNotice(sqlSession, noticeNo);
	}
	
	// 게시글 수정하기
	@Override
	public int updateNotice(Notice n) {
		return nDao.updateNotice(sqlSession, n);
	}

	// 게시글 삭제하기
	@Override
	public int deleteNotice(int noticeNo) {
		return nDao.deleteNotice(sqlSession, noticeNo);
	}
	
	// 게시글 검색하기
	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		return nDao.selectSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Notice> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return nDao.selectSearchList(sqlSession, map, pi);
	}
	
	// 게시글 좋아요 count
	@Override
	public int likeCount(Like li) {
		return nDao.likeCount(sqlSession, li);
	}
	
	// 게시글 좋아요
	@Override
	public int insertLike(Like l) {
		return nDao.insertLike(sqlSession, l);
	}
	
	// 게시글 좋아요 취소
	@Override
	public int deleteLike(Like l) {
		return nDao.deleteLike(sqlSession, l);
	}
	
	// 게시글 전체 좋아요 count
	@Override
	public ArrayList<Like>selectLikeCount(int noticeNo) {
		return nDao.selectLikeCount(sqlSession, noticeNo);
	}


	
	
}
