package com.kh.oworks.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oworks.approval.model.dao.ApprovalDao;
import com.kh.oworks.approval.model.vo.Approval;
import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.employee.model.vo.Employee;

@Service
public class ApprovalServiceImpl implements ApprovalService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApprovalDao appDao;
	
	// 전자결재 메인 조회
	@Override
	public int selectListCount() {
		return appDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Approval> selectList() {
		return appDao.selectList(sqlSession);
	}

	// 결재선 부서원 조회
	
	@Override
	public ArrayList<Employee> selectDepartmentList() {
		return appDao.selectDepartmentList(sqlSession);
	}


}
