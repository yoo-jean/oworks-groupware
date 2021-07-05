package com.kh.oworks.board.model.service;

import java.util.ArrayList;

import com.kh.oworks.board.model.vo.DataBoard;
import com.kh.oworks.board.model.vo.DataFile;
import com.kh.oworks.common.model.vo.PageInfo;

public interface DataBoardService {
	
	// 자료실 리스트 조회 (페이징 처리)
	int selectListCount();
	ArrayList<DataBoard> selectDataBoardList(PageInfo pi);
	
	// 자료실 작성
	int insertDataBoard(DataBoard db);
	
	// 자료실 상세 조회
	int increaseCount(int boardNo);
	DataBoard selectDataBoard(int boardNo);
	
	// 자료실 수정
	int updateDataBoard(DataBoard db);
	
	// 자료실 삭제
	int deleteDataBoard(int boardNo);
	

}
