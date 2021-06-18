package com.kh.oworks.approval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oworks.approval.model.vo.Approval;
import com.kh.oworks.approval.model.vo.ApprovalComment;
import com.kh.oworks.approval.model.vo.ApprovalLine;
import com.kh.oworks.approval.model.vo.FilePath;
import com.kh.oworks.employee.model.vo.Employee;

@Repository
public class ApprovalDao {

	// 전자결제 메인 조회
	public int selectListCount(SqlSessionTemplate sqlSession){
		return sqlSession.selectOne("approvalMapper.selectListCount");
	}
	
	// 전자결재 메인 조회 로그인 기능 생기면 쓸거
	/*
	public ArrayList<Approval> selectList(SqlSessionTemplate sqlSession, int empNo){
		
		//int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		//int limit = pi.getBoardLimit();
		
		//RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectList", empNo);
	}
	*/
	
	// 전자결재 메인 조회 로그인 기능 생기면 지울거
	public ArrayList<Approval> selectList(SqlSessionTemplate sqlSession){
		
		//int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		//int limit = pi.getBoardLimit();
		
		//RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectList");
	}
	
	// 전자결재 상세보기
	public int increaseCount(SqlSessionTemplate sqlSession, String appNo) {
		return sqlSession.update("approvalMapper.increaseCount", appNo);
	}
	
	public Approval selectApproval(SqlSessionTemplate sqlSession, String appNo) {
		return sqlSession.selectOne("approvalMapper.selectApproval", appNo);
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
	
	// 기안서 작성할 때 결재선 테이블에 넣기
	public int insertApprovalLine(SqlSessionTemplate sqlSession, ArrayList<ApprovalLine> llist) {
		System.out.println(llist);
		return sqlSession.insert("approvalMapper.insertApprovalLine", llist);
	}
	
	
	
	// 결재선 부서원 조회
	public ArrayList<Employee> selectDepartmentList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDepartmentList");
	}
	
	

}
