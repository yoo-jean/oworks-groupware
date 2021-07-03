package com.kh.oworks.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oworks.board.model.vo.DataBoard;
import com.kh.oworks.common.model.vo.PageInfo;

@Repository
public class DataBoardDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("dataBoardMapper.selectListCount");
	}
	
	
	public ArrayList<DataBoard> selectDataBoardList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("dataBoardMapper.selectDataBoardList", null, rowBounds);
		
	}
	
	
	public int insertDataBoard(SqlSessionTemplate sqlSession, DataBoard db) {
		
		return sqlSession.insert("dataBoardMapper.insertDataBoard", db);
	}

}
