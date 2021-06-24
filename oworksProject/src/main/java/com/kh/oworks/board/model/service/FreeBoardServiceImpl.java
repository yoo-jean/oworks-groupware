package com.kh.oworks.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oworks.board.model.dao.FreeBoardDao;
import com.kh.oworks.board.model.vo.FreeBoard;
import com.kh.oworks.board.model.vo.Reply;
import com.kh.oworks.common.model.vo.PageInfo;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FreeBoardDao fbDao;

	
	// 전체 게시글 개수
	@Override
	public int selectListCount() {
		return fbDao.selectListCount(sqlSession);
	}

	// 전체 게시글 조회
	@Override
	public ArrayList<FreeBoard> selectList(PageInfo pi) {
		return fbDao.selectList(sqlSession, pi);
	}
	
	// 게시글 작성
	@Override
	public int insertFreeBoard(FreeBoard fb) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 게시글 조회수
	@Override
	public int increaseCount(int fbNo) {
		return fbDao.increaseCount(sqlSession, fbNo);
	}

	// 게시글 상세
	@Override
	public FreeBoard selectFreeBoard(int fbNo) {
		return fbDao.selectFreeBoard(sqlSession, fbNo);
	}

	// 게시글 수정
	@Override
	public int updateFreeBoard(FreeBoard fb) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 게시글 삭제
	@Override
	public int deleteFreeBoard(int fbNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 게시글 댓글 조회
	@Override
	public ArrayList<FreeBoard> selectReplyList(int fbNo) {
		// TODO Auto-generated method stub
		return null;
	}

	// 게시글 댓글 작성
	@Override
	public int insertReply(Reply r) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 게시글 검색
	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<FreeBoard> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

}
