package com.kh.oworks.commute.model.service;

import java.util.ArrayList;

import com.kh.oworks.commute.model.vo.Commute;

public interface CommuteService {
	
	// 사용자 인사관리_휴가관리
	ArrayList<Commute> offList(int empNo);
	
	// 사용자 인사관리_근무현황
	ArrayList<Commute> adList(int empNo);
	
	// 메인 출근시간 기록
	int empIn(int empNo);
	
	// 메인 출근시간 조회
	String selectEmpIn(int empNo);
	
}
