package com.kh.oworks.approval.model.service;

import java.util.ArrayList;

import com.kh.oworks.approval.model.vo.Approval;
import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.employee.model.vo.Employee;

public interface ApprovalService {
	//게시판 리스트 조회 (페이징 처리)
	int selectListCount();
	ArrayList<Approval> selectList();
	
	// 결재선 내 부서원 조회
	ArrayList<Employee> selectDepartmentList();
	
	
}
