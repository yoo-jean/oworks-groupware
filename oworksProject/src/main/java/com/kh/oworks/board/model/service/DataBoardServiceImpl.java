package com.kh.oworks.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oworks.board.model.dao.DataBoardDao;
import com.kh.oworks.board.model.vo.DataBoard;
import com.kh.oworks.common.model.vo.PageInfo;

@Service
public class DataBoardServiceImpl implements DataBoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataBoardDao dDao;

	@Override
	public int selectListCount() {
		return dDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<DataBoard> selectDataBoardList(PageInfo pi) {
		return dDao.selectDataBoardList(sqlSession, pi);
	}

	@Override
	public int insertDataBoard(DataBoard db) {
		return dDao.insertDataBoard(sqlSession, db);
	}

	@Override
	public int increaseCount(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public DataBoard selectDataBoard(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateDataBoard(DataBoard db) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteDataBoard(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
