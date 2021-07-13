package com.kh.oworks.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.oworks.approval.model.vo.Approval;
import com.kh.oworks.approval.model.vo.ApprovalComment;
import com.kh.oworks.approval.model.vo.ApprovalLine;
import com.kh.oworks.approval.model.vo.FilePath;
import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.employee.model.vo.Employee;
import com.sun.xml.internal.ws.api.message.Attachment;

public interface ApprovalService {
	
	
	//전자결재 리스트 조회 (페이징 처리)
	int selectListCount(ApprovalLine al);
	
	//전자결재 메인 대기리스트 조회
	ArrayList<ApprovalLine> selectWaitList(PageInfo pi, ApprovalLine al);
	
	//전자결재 메인 진행리스트 조회 
	ArrayList<ApprovalLine> selectList(PageInfo pi, ApprovalLine al);
	
	//ArrayList<Approval> selectList();
	
	//전자결재 메인 완료리스트 조회
	ArrayList<ApprovalLine> selectFinishList(PageInfo pi, ApprovalLine al);
	
	//전자결재 상세보기
	int increaseCount(String appNo);
	Approval selectApproval(String appNo);
	ArrayList<ApprovalLine> selectApprovalLine(String appNo);
	ArrayList<Attachment> selectAttachment(String appNo);
	ArrayList<ApprovalLine> selectApprovalLineRefer(String appNo);
	
	//기안서 수정하기
	int updateSaveApproval(Approval a);
	
	//기안서 수정하기 첨부파일
	int updateSaveApprovalFile(FilePath fp);
	
	//기안서 수정하기 결재선(삭제)
	int deleteAppLine(String appNo);
	
	//기안서 수정하기 결재선
	int updateAppLine(ArrayList<ApprovalLine> apLineList);
	
	
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
	
	/*기안서 참조선
	int insertReferLine(ArrayList<ApprovalLine> apLineList);
	*/
	
	//기안서 임시저장
	int insertApprovalSave(Approval a);
	
	//기안서 첨부파일 임시저장
	int insertFilePathSave(FilePath fp);
	
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
	
	//결재테이블에서 상태 변경 승인 || 완료 (마지막결재자 찾아서 변경)
	int updateApprovalStatus(Approval a);
	
	//결재선 테이블에서 상태변경 진행 -> 완료
	int updateApprovalLineStatus(Approval a);
	
	//결재상태에 따른 키워드 검색
	int selectSearchCount(HashMap<String, String> map);
	ArrayList<ApprovalLine> selectSearchListState(HashMap<String, String> map, PageInfo pi);
	
	//기안서 회수하기
	int collectApproval(String appNo);
	
	//기안서 회수하기 결재선
	int changeStatus(String appNo);
	
	//[관리자] 전체결재문서 조회
	int selectAllListCount();
	ArrayList<Approval> selectApprovalAllList(PageInfo pi);
	
	//[관리자] 전체문서 키워드 검색
	int selectSearchAllListCount(HashMap<String, String> map);
	ArrayList<Approval> selectSearchAllList(HashMap<String, String> map, PageInfo pi);
	
	//[관리자] 전자결재 삭제
	int deleteApproval(String[] updateList);
	
	//[관리자] 전자결재 삭제문서 조회
	int selectDeleteListCount();
	ArrayList<Approval> selectApprovalDeleteList(PageInfo pi);
	
	//[관리자] 전자결재 삭제
	int restoreApproval(String[] updateList);
}
