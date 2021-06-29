package com.kh.oworks.approval.model.dao;

import java.util.ArrayList;

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
	public int selectListCount(SqlSessionTemplate sqlSession, Approval a){
		//System.out.println(a);
		return sqlSession.selectOne("approvalMapper.selectListCount");
	}
	
	// 전자결재 메인 조회 로그인 기능 생기면 쓸거
	public ArrayList<Approval> selectList(SqlSessionTemplate sqlSession, PageInfo pi, Approval a){
		
		//System.out.println(a);
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectList", a, rowBounds);
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
		//System.out.println(al);
		return sqlSession.insert("approvalMapper.insertAddLine", apLineList);
	}
	
	// 기안서 임시저장
	public int saveApproval(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.insert("approvalMapper.saveApproval", a);
	} 
	
	// 결재선 부서원 조회
	public ArrayList<Employee> selectDepartmentList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDepartmentList");
	}
	
	// 승인, 반려버튼 클릭시 update
	public int updateApproval(SqlSessionTemplate sqlSession, ApprovalLine al) {
		System.out.println(al);
		return sqlSession.update("approvalMapper.updateApproval", al);
	}

}
