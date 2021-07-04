package com.kh.oworks.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oworks.board.model.vo.Like;
import com.kh.oworks.board.model.vo.Notice;
import com.kh.oworks.common.model.vo.PageInfo;

@Repository
public class NoticeDao {
	// 게시글 개수 
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	// 게시글 리스트 조회
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}
	
	// 게시글 상세보기
	
	public int increaseCount(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.increaseCount", noticeNo);
		
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}
	
	// 게시글 수정하기
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
	// 게시글 작성하기
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	// 게시글 삭제하기
	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}
	
	// 게시글 검색하기
	public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String>map) {
		return sqlSession.selectOne("noticeMapper.selectSearchListCount", map);
	}
	
	public ArrayList<Notice> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String>map, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        
        return (ArrayList)sqlSession.selectList("noticeMapper.selectSearchList", map, rowBounds);
	}
	
	// 게시글 좋아요 count
	public int likeCount(SqlSessionTemplate sqlSession, Like li) {
		//System.out.println(li);
		return sqlSession.selectOne("noticeMapper.likeCount", li);
	}
	
	// 게시글 좋아요
	public int insertLike(SqlSessionTemplate sqlSession, Like l) {
		return sqlSession.insert("noticeMapper.insertLike", l);
	}
	
	// 게시글 좋아요 취소
	public int deleteLike(SqlSessionTemplate sqlSession, Like l) {
		return sqlSession.delete("noticeMapper.deleteLike", l);
	}
	
	// 게시글 전체 좋아요 count
	public ArrayList<Like> allLike(SqlSessionTemplate sqlSession, int noticeNo) {
		return (ArrayList)sqlSession.selectList("noticeMapper.allLike", noticeNo);
	}
}
