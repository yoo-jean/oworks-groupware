package com.kh.oworks.commute.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oworks.commute.model.dao.CommuteDao;
import com.kh.oworks.commute.model.vo.Commute;

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
	
	// 사용자 인사관리_근무현황
	@Override
	public ArrayList<Commute> adList(int empNo) {
		return cDao.adList(sqlSession, empNo);
	}
	
	// 메인 출근시간 기록
	@Override
	public int empIn(int empNo) {
		return cDao.empIn(sqlSession, empNo);
	}
	
	// 메인 출근시간 조회
	@Override
	public String selectEmpIn(int empNo) {
		return cDao.selectEmpIn(sqlSession, empNo);
	}

	
}
