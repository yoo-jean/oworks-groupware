package com.kh.oworks.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oworks.approval.model.vo.Approval;
import com.kh.oworks.approval.model.vo.ApprovalComment;
import com.kh.oworks.approval.model.vo.ApprovalLine;
import com.kh.oworks.approval.model.vo.FilePath;
import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.employee.model.vo.Employee;
import com.sun.xml.internal.ws.api.message.Attachment;

@Repository
public class ApprovalDao {

	// 전자결제 메인 조회
	public int selectListCount(SqlSessionTemplate sqlSession, ApprovalLine al){
		//System.out.println(al);
		return sqlSession.selectOne("approvalMapper.selectListCount", al);
	}
	
	
	// 전자결재 메인 대기문서 조회
	public ArrayList<ApprovalLine> selectWaitList(SqlSessionTemplate sqlSession, PageInfo pi, ApprovalLine al){
		
		//System.out.println(al);
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectWaitList", al, rowBounds);
	}
	
	// 전자결재 메인 진행문서 조회
	public ArrayList<ApprovalLine> selectList(SqlSessionTemplate sqlSession, PageInfo pi, ApprovalLine al){
		
		//System.out.println(a);
		System.out.println(al.getStatus());
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectList", al, rowBounds);
	}
	
	// 전자결재 메인 완료문서 조회
	public ArrayList<ApprovalLine> selectFinishList(SqlSessionTemplate sqlSession, PageInfo pi, ApprovalLine al){
		
		//System.out.println(a);
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectFinishList", al, rowBounds);
	}
	
	// 전자결재 상세보기
	public int increaseCount(SqlSessionTemplate sqlSession, String appNo) {
		return sqlSession.update("approvalMapper.increaseCount", appNo);
	}
	
	public Approval selectApproval(SqlSessionTemplate sqlSession, String appNo) {
		return sqlSession.selectOne("approvalMapper.selectApproval", appNo);
	}
	
	// 전자결재 상세보기 결재선 조회
	public ArrayList<ApprovalLine> selectApprovalLine(SqlSessionTemplate sqlSession, String appNo){
		//System.out.println(appNo);
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalLine", appNo);
	}
	
	// 전자결재 상세보기 첨부파일 조회
	public ArrayList<Attachment> selectAttachment(SqlSessionTemplate sqlSession, String appNo){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectAttachment", appNo);
	}
	
	// 기안서에 달린 코멘트 리스트 조회
	public ArrayList<ApprovalComment> selectCommentList(SqlSessionTemplate sqlSession, String appNo){
		//System.out.println(appNo);
		return (ArrayList)sqlSession.selectList("approvalMapper.selectCommentList", appNo);
	}
	
	// 기안서에 코멘트 작성하기
	public int insertComment(SqlSessionTemplate sqlSession, ApprovalComment ac) {
		return sqlSession.insert("approvalMapper.insertComment", ac);
	}
	
	// 기안작성하기
	public int insertApproval(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.insert("approvalMapper.insertApproval", a);
	}
	
	// 첨부파일
	public int insertFilePath(SqlSessionTemplate sqlSession, FilePath fp) {
		return sqlSession.insert("approvalMapper.insertFilePath", fp);
	}
	
	// 기안서 결재선
	public int insertAddLine(SqlSessionTemplate sqlSession, ArrayList<ApprovalLine> apLineList) {
		//System.out.println(apLineList);
		return sqlSession.insert("approvalMapper.insertAddLine", apLineList);
	}
	
	// 기안서 임시저장
	public int insertApprovalSave(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.insert("approvalMapper.insertApprovalSave", a);
	} 
	
	// 기안서 결재선 임시저장
	public int insertAddLineSave(SqlSessionTemplate sqlSession, ArrayList<ApprovalLine> apLineList) {
		//System.out.println(apLineList);
		return sqlSession.insert("approvalMapper.insertAddLineSave", apLineList);
	}
	
	
	// 임시저장 count
	public int selectSaveListCount(SqlSessionTemplate sqlSession, Approval a){
		//System.out.println(a);
		return sqlSession.selectOne("approvalMapper.selectSaveListCount");
	}
	
	
	// 임시저장 페이지로 이동
	public ArrayList<Approval> selectSaveList(SqlSessionTemplate sqlSession, PageInfo pi, Approval a){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSaveList", a, rowBounds);
	} 
	
	// 임시저장 검색하기
	
	public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String>map) {
		return sqlSession.selectOne("approvalMapper.selectSearchListCount", map);
	}
	
	public ArrayList<Approval> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String>map, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        
        return (ArrayList)sqlSession.selectList("approvalMapper.selectSearchList", map, rowBounds);
	}
	
	
	// 결재선 부서원 조회
	public ArrayList<Employee> selectDepartmentList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDepartmentList");
	}
	
	// 승인, 반려버튼 클릭시 update
	public int updateApproval(SqlSessionTemplate sqlSession, ApprovalLine al) {
		//System.out.println(al);
		return sqlSession.update("approvalMapper.updateApproval", al);
	}
	
	// 결재 상태 변경
	public int updateApprovalStatus(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.update("approvalMapper.updateApprovalStatus", a);
	}
	
	
	// test
	public int selectProgressListCount(SqlSessionTemplate sqlSession, ApprovalLine al){
		//System.out.println(al);
		return sqlSession.selectOne("approvalMapper.selectProgressListCount");
	}
	
	
	
}
