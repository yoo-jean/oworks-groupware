package com.kh.oworks.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oworks.approval.model.dao.ApprovalDao;
import com.kh.oworks.approval.model.vo.Approval;
import com.kh.oworks.approval.model.vo.ApprovalComment;
import com.kh.oworks.approval.model.vo.ApprovalLine;
import com.kh.oworks.approval.model.vo.FilePath;
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
	
	/* 로그인 기능 생기면 쓸거
	@Override
	public ArrayList<Approval> selectList(int empNo) {
		return appDao.selectList(sqlSession, empNo);
	}
	*/
	
	// 로그인 기능 생기면 지울거
	@Override
	public ArrayList<Approval> selectList() {
		return appDao.selectList(sqlSession);
	}
	
	// 전자결제 상세보기
	@Override
	public int increaseCount(String appNo) {
		return appDao.increaseCount(sqlSession, appNo);
	}
	
	@Override
	public Approval selectApproval(String appNo) {
		return appDao.selectApproval(sqlSession, appNo);
	}
	
	// 기안서에 달린 코멘트 리스트 조회
	@Override
	public ArrayList<ApprovalComment> selectCommentList(String appNo) {
		return appDao.selectCommentList(sqlSession, appNo);
	}
	
	// 기안서에 코멘트 작성
	@Override
	public int insertComment(ApprovalComment ac) {
		return appDao.insertComment(sqlSession, ac);
	}

	// 기안서 작성하기
	@Override
	public int insertApproval(Approval a, FilePath fp, ArrayList<ApprovalLine> llist) {
		
		int result1 = appDao.insertApproval(sqlSession, a);
		int result2 = 1;
		int result3 = appDao.insertApprovalLine(sqlSession, llist);
		
		if(fp != null) {
			result2 = appDao.insertFilePath(sqlSession, fp);
		}
		
		return result1*result2*result3;
		
	}
	
	// 결재선 부서원 조회
	@Override
	public ArrayList<Employee> selectDepartmentList() {
		return appDao.selectDepartmentList(sqlSession);
	}


	

}
