package com.kh.oworks.commute.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oworks.commute.model.dao.CommuteDao;
import com.kh.oworks.commute.model.vo.Commute;
import com.kh.oworks.commute.model.vo.CommuteMain;
import com.kh.oworks.employee.model.vo.Employee;

@Service
public class CommuteServiceImpl implements CommuteService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CommuteDao cDao;
	
	// 사용자 인사관리_휴가관리
	@Override
	public ArrayList<Commute> offList(int empNo) {
		return cDao.offList(sqlSession, empNo);
	}
	
	// 사용자 인사관리_휴가 신청서 작성
	@Override
	public int insertOff(Commute c) {
		return cDao.insertOff(sqlSession, c);
	}
	
	// 사용자 인사관리_근무현황
	@Override
	public ArrayList<Commute> adList(String condition) {
		return cDao.adList(sqlSession, condition);
	}
	
	// 메인 출근시간 기록
	@Override
	public int insertEmpIn(int empNo) {
		return cDao.insertEmpIn(sqlSession, empNo);
	}
	
	// 메인 출근시간 조회
	@Override
	public String selectEmpIn(String empId) {
		return cDao.selectEmpIn(sqlSession, empId);
	}
	
	// 메인 퇴근시간 기록
	@Override
	public int updateEmpOut(int empNo) {
		return cDao.updateEmpOut(sqlSession, empNo);
	}
	
	// 메인 근무현황 조회
	@Override
	public Commute selectEmpCommute(int cEmpNo) {
		//System.out.println("서비스 : " + cEmpNo);
		return cDao.selectEmpCommute(sqlSession, cEmpNo);
	}

	
}
