package com.kh.oworks.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	public int selectListCount(ApprovalLine al) {
		//System.out.println(a);
		return appDao.selectListCount(sqlSession, al);
	}
	
	// 전자결재 메인 대기
	@Override
	public ArrayList<ApprovalLine> selectWaitList(PageInfo pi, ApprovalLine al) {
		//System.out.println(a);
		return appDao.selectWaitList(sqlSession, pi, al);
	}
	
	// 전자결재 메인 진행
	@Override
	public ArrayList<ApprovalLine> selectList(PageInfo pi, ApprovalLine al) {
		//System.out.println(a);
		return appDao.selectList(sqlSession, pi, al);
	}	
		
	// 전자결재 메인 완료
	@Override
	public ArrayList<ApprovalLine> selectFinishList(PageInfo pi, ApprovalLine al) {
		//System.out.println(a);
		return appDao.selectFinishList(sqlSession, pi, al);
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
	
	// 전자결재 상세보기 참조자 조회
	@Override
	public ArrayList<ApprovalLine> selectApprovalLineRefer(String appNo) {
		return appDao.selectApprovalLineRefer(sqlSession, appNo);
	}

	// 기안서 수정하기
	@Override
	public int updateSaveApproval(Approval a) {
		return appDao.updateSaveApproval(sqlSession, a);
	}
	
	// 기안서 수정하기 결재선
	@Override
	public int updateAddLine(ArrayList<ApprovalLine> apLineList) {
		return appDao.updateAddLine(sqlSession, apLineList);
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
	
	// 기안서 참조선
	@Override
	public int insertReferLine(ArrayList<ApprovalLine> apLineList) {
		return appDao.insertReferLine(sqlSession, apLineList);
	}

	
	// 기안서 임시저장
	@Override
	public int insertApprovalSave(Approval a) {
		return appDao.insertApprovalSave(sqlSession, a);
	}
	
	// 임시저장 count
	@Override
	public int selectSaveListCount(Approval a) {
		return appDao.selectSaveListCount(sqlSession, a);
	}
	
	// 임시저장 페이지로 이동
	@Override
	public ArrayList<Approval> selectSaveList(PageInfo pi, Approval a) {
		return appDao.selectSaveList(sqlSession, pi, a);
	}
	
	// 임시저장 검색
	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		return appDao.selectSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Approval> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return appDao.selectSearchList(sqlSession, map, pi);
	}
	
	// 기안서 첨부파일 임시저장
	@Override
	public int insertFilePathSave(FilePath fp) {
		return appDao.insertFilePathSave(sqlSession, fp);
	}
	
	// 기안서 결재선 임시저장
	@Override
	public int insertAddLineSave(ArrayList<ApprovalLine> apLineList) {
		return appDao.insertAddLineSave(sqlSession, apLineList);
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
	
	// 결재 진행상태 변경
	@Override
	public int updateApprovalStatus(Approval a) {
		return appDao.updateApprovalStatus(sqlSession, a);
	}
	
	// 결재선 진행상태 변경
	@Override
	public int updateApprovalLineStatus(Approval a) {
		return appDao.updateApprovalLineStatus(sqlSession, a);
	}
	
	// 결재상태에 따른 키워드 검색
	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		return appDao.selectSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<ApprovalLine> selectSearchListState(HashMap<String, String> map, PageInfo pi) {
		return appDao.selectSearchListState(sqlSession, map, pi);
	}
	
	// 기안서 회수하기
	@Override
	public int collectApproval(String appNo) {
		return appDao.collectApproval(sqlSession, appNo);
	}
	
	// 기안서 회수하기 결재선
	@Override
	public int changeStatus(String appNo) {
		return appDao.changeStatus(sqlSession, appNo);
	}
	
	
	// [관리자] 전자결재 전체 조회
	@Override
	public int selectAllListCount() {
		return appDao.selectAllListCount(sqlSession);
	}

	@Override
	public ArrayList<Approval> selectApprovalAllList(PageInfo pi) {
		return appDao.selectApprovalAllList(sqlSession, pi);
	}
	
	// [관리자] 전자결체 키워드 검색
	@Override
	public int selectSearchAllListCount(HashMap<String, String> map) {
		return appDao.selectSearchAllListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Approval> selectSearchAllList(HashMap<String, String> map, PageInfo pi) {
		return appDao.selectSearchAllList(sqlSession, map, pi);
	}
	
	// [관리자] 전자결재 삭제
	@Override
	public int deleteApproval(String[] updateList) {
		return appDao.deleteApproval(sqlSession, updateList);
	}
	
	//[관리자] 전자결재 삭제문서 조회
	@Override
	public int selectDeleteListCount() {
		return appDao.selectDeleteListCount(sqlSession);
	}

	@Override
	public ArrayList<Approval> selectApprovalDeleteList(PageInfo pi) {
		return appDao.selectApprovalDeleteList(sqlSession, pi);
	}







	
	

	
	
}
