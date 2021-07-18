package com.kh.oworks.admin.model.service;

import java.util.ArrayList;

import com.kh.oworks.admin.model.vo.Admin;
import com.kh.oworks.common.model.vo.PageInfo;

public interface AdminService {
	
	// 관리자 근태통계 조회 (페이징 처리)
	int selectEmpCount();
	ArrayList<Admin> selectAdList(PageInfo pi);
	
	// 관리자 일일 출퇴근 현황 조회 (페이징 처리)
	int selectAdCount(String workDate);
	ArrayList<Admin> selectList(PageInfo pi, String workDate);
	
	// 관리자 휴가현황 조회 (페이징 처리)
	int selectOffCount();
	ArrayList<Admin> selectOffList(PageInfo pi, String condition);
	
	// 관리자 휴가분류 조회
	ArrayList<Admin> selectOffCate();
	
	// 관리자 휴가분류 작성
	int insertOffCate(Admin a);
	
	// 관리자 휴가분류 수정
	int updateOffCate(Admin a);
	
	// 관리자 휴가분류 삭제
	int deleteOffCate(int offCateNo);

}
