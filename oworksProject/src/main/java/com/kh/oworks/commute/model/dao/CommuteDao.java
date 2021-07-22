package com.kh.oworks.commute.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oworks.commute.model.vo.Commute;
import com.kh.oworks.employee.model.vo.Employee;

@Repository
public class CommuteDao {
	
	// 사용자 인사관리_휴가관리
	public ArrayList<Commute> offList(SqlSessionTemplate sqlSession, int empNo) {
		return (ArrayList)sqlSession.selectList("commuteMapper.selectOffList", empNo);
	}
	
	// 사용자 인사관리_휴가 신청서 작성
	public int insertOff(SqlSessionTemplate sqlSession, Commute c) {
		return sqlSession.insert("commuteMapper.insertOff", c);
	}
	
	// 사용자 인사관리_근무현황
	public ArrayList<Commute> adList(SqlSessionTemplate sqlSession, String condition) {
		return (ArrayList)sqlSession.selectList("commuteMapper.selectAdList", condition);
	}
	
	// 화면 출근시간 기록
	public int insertEmpIn(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.insert("commuteMapper.insertEmpIn", empNo);
	}
	
	// 화면 출근시간 조회
	public String selectEmpIn(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.selectOne("commuteMapper.selectEmpIn", empId);
	}
	
	// 화면 퇴근시간 기록
	public int updateEmpOut(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.update("commuteMapper.updateEmpOut", empNo);
	}
	
	// 메인 근무현황 조회
	public Commute selectEmpCommute(SqlSessionTemplate sqlSession, int cEmpNo) {
		//System.out.println("DAO : " + cEmpNo);
		return (Commute)sqlSession.selectOne("commuteMapper.selectEmpCommute", cEmpNo);
	}


}
