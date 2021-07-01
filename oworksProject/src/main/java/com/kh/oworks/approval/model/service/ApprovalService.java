package com.kh.oworks.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	//전자결재 메인 대기리스트 조회
	ArrayList<Approval> selectWaitList(PageInfo pi, Approval a);
	
	//전자결재 메인 진행리스트 조회 
	ArrayList<Approval> selectList(PageInfo pi, Approval a);
	//ArrayList<Approval> selectList();
	
	//전자결재 메인 완료리스트 조회
	ArrayList<Approval> selectFinishList(PageInfo pi, Approval a);
	
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
	
	//기안서 임시저장
	int insertApprovalSave(Approval a);
	
	//기안서 결재선 임시저장
	int insertAddLineSave(ArrayList<ApprovalLine> apLineList);
	
	//임시저장 리스트 조회 (페이징 처리)
	int selectSaveListCount(Approval a);
	
	//임시저장 페이지로 이동
	ArrayList<Approval> selectSaveList(PageInfo pi, Approval a);
	
	//임시저장 검색
	int selectSearchListCount(HashMap<String, String> map);
	ArrayList<Approval> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	//결재선 내 부서원 조회
	ArrayList<Employee> selectDepartmentList();
	
	//승인, 반려 버튼 클릭시 update
	int updateApproval(ApprovalLine al);
	
	int updateApprovalStatus(Approval a);
	
	
}
