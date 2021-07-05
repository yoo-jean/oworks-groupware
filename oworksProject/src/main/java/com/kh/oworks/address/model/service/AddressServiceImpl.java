package com.kh.oworks.address.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oworks.address.model.dao.AddressDao;
import com.kh.oworks.address.model.vo.Address;
import com.kh.oworks.common.model.vo.PageInfo;

@Service
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AddressDao aDao;
	

	@Override
	public int selectListCount() {
		return aDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Address> selectAddressList(PageInfo pi) {
		return aDao.selectAddressList(sqlSession, pi);
	}

	@Override
	public int insertAddress(int submitEmpNo) {
		return aDao.insertAddress(sqlSession, submitEmpNo);
	}

	@Override
	public int deleteAddress(int empNo) {
		return aDao.deleteAddress(sqlSession, empNo);
	}

}
