package com.kh.oworks.approval.model.service;

import java.util.ArrayList;

import com.kh.oworks.approval.model.vo.Approval;
import com.kh.oworks.approval.model.vo.ApprovalComment;
import com.kh.oworks.approval.model.vo.ApprovalLine;
import com.kh.oworks.approval.model.vo.FilePath;
import com.kh.oworks.employee.model.vo.Employee;

public interface ApprovalService {
	
	
	//전자결재 리스트 조회 (페이징 처리)
	int selectListCount();
	//ArrayList<Approval> selectList(int empNo);
	ArrayList<Approval> selectList();
	
	//전자결재 상세보기
	int increaseCount(String appNo);
	Approval selectApproval(String appNo);
	
	//해당 기안서에 달린 의견리스트 조회
	ArrayList<ApprovalComment> selectCommentList(String appNo);
	
	//기안서에 코멘트 작성
	int insertComment(ApprovalComment ac);
	
	//기안서 작성하기
	int insertApproval(Approval a);
	
	//기안서 첨부파일
	int insertFilePath(FilePath fp);
	
	//기안서 결재선
	int insertAddLine(ArrayList<ApprovalLine> apLineList);
	
	//결재선 내 부서원 조회
	ArrayList<Employee> selectDepartmentList();
	

}
