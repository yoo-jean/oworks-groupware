package com.kh.oworks.commute.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oworks.commute.model.vo.Commute;

@Repository
public class CommuteDao {
	
	// 사용자 인사관리_휴가관리
	public ArrayList<Commute> offList(SqlSessionTemplate sqlSession, int empNo) {
		return (ArrayList)sqlSession.selectList("commuteMapper.selectOffList", empNo);
	}
	
	// 사용자 인사관리_근무현황
	public ArrayList<Commute> adList(SqlSessionTemplate sqlSession, int empNo) {
		return (ArrayList)sqlSession.selectList("commuteMapper.selectAdList", empNo);
	}
	
	// 화면 출근시간 기록
	public int empIn(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.insert("commuteMapper.empIn", empNo);
	}
	
	// 화면 출근시간 조회
	public String selectEmpIn(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("commuteMapper.selectEmpIn");
	}


}
