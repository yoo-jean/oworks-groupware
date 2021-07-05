package com.kh.oworks.address.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oworks.address.model.dao.AddressOutDao;
import com.kh.oworks.address.model.vo.AddressOut;
import com.kh.oworks.common.model.vo.PageInfo;

@Service
public class AddressOutServiceImpl implements AddressOutService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AddressOutDao oDao;
	

	@Override
	public int selectListCount() {
		return oDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<AddressOut> selectAddressOutList(PageInfo pi) {
		return oDao.selectAddressOutList(sqlSession, pi);
	}

	@Override
	public int insertAddressOut(AddressOut ao) {
		return oDao.insertAddressOut(sqlSession, ao);
	}

	@Override
	public int updateAddressOut(AddressOut ao) {
		return oDao.updateAddressOut(sqlSession, ao);
	}

	@Override
	public int deleteAddressOut(int addOutNo) {
		return oDao.deleteAddressOut(sqlSession, addOutNo);
	}

}
