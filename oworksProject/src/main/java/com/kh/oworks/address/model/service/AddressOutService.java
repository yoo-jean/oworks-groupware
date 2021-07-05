package com.kh.oworks.address.model.service;

import java.util.ArrayList;

import com.kh.oworks.address.model.vo.AddressOut;
import com.kh.oworks.common.model.vo.PageInfo;

public interface AddressOutService {
	
	// 리스트 조회
	int selectListCount();
	ArrayList<AddressOut> selectAddressOutList(PageInfo pi);
	
	// insert
	int insertAddressOut(AddressOut ao);
	
	// update
	int updateAddressOut(AddressOut ao);
	
	// delete
	int deleteAddressOut(int outNo);

}
