package com.kh.oworks.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oworks.approval.model.vo.Approval;
import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.employee.model.vo.Employee;

@Repository
public class ApprovalDao {

	// 전자결제 메인 조회
	public int selectListCount(SqlSessionTemplate sqlSession){
		return sqlSession.selectOne("approvalMapper.selectListCount");
	}
	
	// 전자결재 메인 조회
	public ArrayList<Approval> selectList(SqlSessionTemplate sqlSession){
		
		//int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		//int limit = pi.getBoardLimit();
		
		//RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectList");
	}
	
	// 결재선 부서원 조회
	
	public ArrayList<Employee> selectDepartmentList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDepartmentList");
	}
	

}
