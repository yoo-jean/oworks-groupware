package com.kh.oworks.approval.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oworks.approval.model.dao.ApprovalDao;
import com.kh.oworks.approval.model.vo.Approval;
import com.kh.oworks.approval.model.vo.ApprovalComment;
import com.kh.oworks.approval.model.vo.ApprovalLine;
import com.kh.oworks.approval.model.vo.FilePath;
import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.employee.model.vo.Employee;
import com.sun.xml.internal.ws.api.message.Attachment;

@Service
public class ApprovalServiceImpl implements ApprovalService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApprovalDao appDao;
	
	// 전자결제 메인 조회
	@Override
	public int selectListCount(Approval a) {
		//System.out.println(a);
		return appDao.selectListCount(sqlSession, a);
	}

	@Override
	public ArrayList<Approval> selectList(PageInfo pi, Approval a) {
		//System.out.println(a);
		return appDao.selectList(sqlSession, pi, a);
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
	
	// 전자결재 상세보기 결재선 조회
	@Override
	public ArrayList<ApprovalLine> selectApprovalLine(String appNo) {
		return appDao.selectApprovalLine(sqlSession, appNo);
	}
	
	// 전자결재 상세보기 첨부파일 조회
	@Override
	public ArrayList<Attachment> selectAttachment(String appNo) {
		return appDao.selectAttachment(sqlSession, appNo);
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
	public int insertApproval(Approval a) {
		return appDao.insertApproval(sqlSession, a);
	}
	
	// 기안서 첨부파일
	@Override
	public int insertFilePath(FilePath fp) {
		return appDao.insertFilePath(sqlSession, fp);
	}
	
	// 기안서 결재선
	@Override
	public int insertAddLine(ArrayList<ApprovalLine> apLineList) {
		return appDao.insertAddLine(sqlSession, apLineList);
	}
	
	// 기안서 임시저장
	@Override
	public int saveApproval(Approval a) {
		return appDao.insertApproval(sqlSession, a);
	}
	
	// 결재선 부서원 조회
	@Override
	public ArrayList<Employee> selectDepartmentList() {
		return appDao.selectDepartmentList(sqlSession);
	}
	
	// 승인, 반려 버튼 클릭시 update
	@Override
	public int updateApproval(ApprovalLine al) {
		return appDao.updateApproval(sqlSession, al);
	}


}
