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
	
	@Override
	public int selectListCount() {
		return aDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Admin> selectList(PageInfo pi) {
		return aDao.selectList(sqlSession, pi);
	}
	
	@Override
	public ArrayList<Admin> selectOffCate() {
		return aDao.selectOffCate(sqlSession);
	}

	@Override
	public int insertOffCate(Admin a) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOffCate(Admin a) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOffCate(int offCateNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
