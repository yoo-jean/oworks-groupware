package com.kh.oworks.commute.model.service;

import java.util.ArrayList;

import com.kh.oworks.commute.model.vo.Commute;
import com.kh.oworks.commute.model.vo.CommuteMain;
import com.kh.oworks.employee.model.vo.Employee;

public interface CommuteService {
	
	// 사용자 인사관리_휴가관리
	ArrayList<Commute> offList(Employee e);
	
	// 사용자 인사관리_휴가 신청서 작성
	int insertOff(Commute c);
	
	// 사용자 인사관리_근무현황
	ArrayList<Commute> adList(String condition);
	
	// 메인 출근시간 기록
	int insertEmpIn(int empNo);
	
	// 메인 출근시간 조회
	String selectEmpIn(String empId);
	
	// 메인 퇴근시간 기록
	int updateEmpOut(int empNo);
	
	// 메인 근무현황 조회
	Commute selectEmpCommute(int cEmpNo);
	
}
