package com.kh.oworks.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oworks.board.model.dao.DataBoardDao;
import com.kh.oworks.board.model.vo.DataBoard;
import com.kh.oworks.board.model.vo.DataFile;
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
	public int increaseCount(int dbno) {
		return dDao.increaseCount(sqlSession, dbno);
	}

	@Override
	public DataBoard selectDataBoard(int dbno) {
		return dDao.selectDataBoard(sqlSession, dbno);
	}

	@Override
	public int updateDataBoard(DataBoard b) {
		return dDao.updateDataBoard(sqlSession, b);
	}

	@Override
	public int deleteDataBoard(int dbno) {
		return dDao.deleteDataBoard(sqlSession, dbno);
	}


}
