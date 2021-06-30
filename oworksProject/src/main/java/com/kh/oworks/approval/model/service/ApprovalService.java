package com.kh.oworks.approval.model.service;

import java.util.ArrayList;

import com.kh.oworks.approval.model.vo.Approval;
import com.kh.oworks.approval.model.vo.ApprovalComment;
import com.kh.oworks.approval.model.vo.ApprovalLine;
import com.kh.oworks.approval.model.vo.FilePath;
import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.employee.model.vo.Employee;
import com.sun.xml.internal.ws.api.message.Attachment;

public interface ApprovalService {
	
	
	//전자결재 리스트 조회 (페이징 처리)
	int selectListCount(Approval a);
	
	ArrayList<Approval> selectList(PageInfo pi, Approval a);
	//ArrayList<Approval> selectList();
	
	//전자결재 상세보기
	int increaseCount(String appNo);
	Approval selectApproval(String appNo);
	ArrayList<ApprovalLine> selectApprovalLine(String appNo);
	ArrayList<Attachment> selectAttachment(String appNo);
	
	
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
	
	// 기안서 임시저장
	int saveApproval(Approval a);
	
	//결재선 내 부서원 조회
	ArrayList<Employee> selectDepartmentList();
	
	//승인, 반려 버튼 클릭시 update
	int updateApproval(ApprovalLine al);
	
	int updateApprovalStatus(Approval a);

}
