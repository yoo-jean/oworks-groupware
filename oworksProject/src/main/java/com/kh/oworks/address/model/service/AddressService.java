package com.kh.oworks.address.model.service;

import java.util.ArrayList;

import com.kh.oworks.address.model.vo.Address;
import com.kh.oworks.common.model.vo.PageInfo;

public interface AddressService {
	
	// address 리스트 조회
	int selectListCount();
	ArrayList<Address> selectAddressList(PageInfo pi);
	
	// insert
	int insertAddress(int submitEmpNo);
	
	// delete
	int deleteAddress(int empNo);
	

}
