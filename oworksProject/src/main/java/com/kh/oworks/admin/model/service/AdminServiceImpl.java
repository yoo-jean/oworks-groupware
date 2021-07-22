package com.kh.oworks.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oworks.admin.model.dao.AdminDao;
import com.kh.oworks.admin.model.vo.Admin;
import com.kh.oworks.common.model.vo.PageInfo;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDao aDao;
	
	// 관리자 근태통계 갯수
	@Override
	public int selectEmpCount() {
		return aDao.selectEmpCount(sqlSession);
	}
	// 관리자 근태통계 조회	
	@Override
	public ArrayList<Admin> selectAdList(PageInfo pi, String condition) {
		return aDao.selectAdList(sqlSession, pi, condition);
	}
	
	// 관리자 일일출퇴근현황 갯수
	@Override
	public int selectAdCount(String workDate) {
		return aDao.selectAdCount(sqlSession, workDate);
	}
	
	// 관리자 일일출퇴근현황 조회
	@Override
	public ArrayList<Admin> selectList(PageInfo pi, String workDate) {
		return aDao.selectList(sqlSession, pi, workDate);
	}
	
	// 관리자 휴가현황 갯수
	@Override
	public int selectOffCount() {
		return aDao.selectOffCount(sqlSession);
	}
	
	// 관리자 휴가현황 조회
	@Override
	public ArrayList<Admin> selectOffList(PageInfo pi, String condition) {
		//System.out.println("serviceimpl: " + condition);
		return aDao.selectOffList(sqlSession, pi, condition);
	}
	
	// 관리자 휴가분류 조회
	@Override
	public ArrayList<Admin> selectOffCate() {
		return aDao.selectOffCate(sqlSession);
	}
	
	// 관리자 휴가분류 작성
	@Override
	public int insertOffCate(Admin a) {
		return aDao.insertOffCate(sqlSession, a);
	}
	
	// 관리자 휴가분류 수정
	@Override
	public int updateOffCate(int offCateNo) {
		return aDao.updateOffCate(sqlSession, offCateNo);
	}
	
	// 관리자 휴가분류 삭제
	@Override
	public int deleteOffCate(int offCateNo) {
		return aDao.deleteOffCate(sqlSession, offCateNo);
	}

}
