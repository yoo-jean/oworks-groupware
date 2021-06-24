package com.kh.oworks.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oworks.board.model.vo.FreeBoard;
import com.kh.oworks.common.model.vo.PageInfo;

@Repository
public class FreeBoardDao {

		// 게시글 개수 
		public int selectListCount(SqlSessionTemplate sqlSession) {
			return sqlSession.selectOne("freeBoardMapper.selectListCount");
		}
		
		// 게시글 리스트 조회
		public ArrayList<FreeBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
			
			int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			
			RowBounds rowBounds = new RowBounds(offset, limit);
			
			return (ArrayList)sqlSession.selectList("freeBoardMapper.selectList", null, rowBounds);
		}

		// 게시판 조회수 증가
		public int increaseCount(SqlSessionTemplate sqlSession, int fbNo) {
			return sqlSession.update("freeBoardMapper.increaseCount", fbNo);
		}

		// 게시판 상세조회
		public FreeBoard selectFreeBoard(SqlSessionTemplate sqlSession, int fbNo) {
			return sqlSession.selectOne("freeBoardMapper.selectFreeBoard", fbNo);
		}

}
