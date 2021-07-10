package com.kh.oworks.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oworks.admin.model.vo.Admin;
import com.kh.oworks.common.model.vo.PageInfo;

@Repository
public class AdminDao {
	
	// 근태통계 목록 갯수
	// 근태통계 조회
	
	// 일일출퇴근현황 목록 갯수
	public int selectAdCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminMapper.selectAdCount");
		
	}
	
	// 일일출퇴근현황 조회
	public ArrayList<Admin> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectList", null, rowBounds);
		
	}
	
	// 휴가현황 목록 갯수
	public int selectOffCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminMapper.selectOffCount");
		
	}
	
	// 휴가현황 조회
	public ArrayList<Admin> selectOffList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("adminMapper.selectOffList", null, rowBounds);
		
	}	
	
	// 휴가분류 조회
	public ArrayList<Admin> selectOffCate(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectOffCate", null);
		
	}
	
	// 휴가분류 작성
	public int insertOffCate(SqlSessionTemplate sqlSession, Admin a) {
		
		return sqlSession.insert("adminMapper.insertOffCate", a);
		
	}
	
	// 휴가분류 삭제
	public int deleteOffCate(SqlSessionTemplate sqlSession, int offCateNo) {
		
		return sqlSession.delete("adminMapper.deleteOffCate", offCateNo);
		
	}

}
