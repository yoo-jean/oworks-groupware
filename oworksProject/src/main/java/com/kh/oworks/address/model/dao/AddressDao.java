package com.kh.oworks.address.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oworks.address.model.vo.Address;
import com.kh.oworks.common.model.vo.PageInfo;

@Repository
public class AddressDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("addressMapper.selectListCount");
	}
	
	
	public ArrayList<Address> selectAddressList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("addressMapper.selectAddressList", null, rowBounds);
		
	}
	
	
	public int insertAddress(SqlSessionTemplate sqlSession, int submitEmpNo) {
		return sqlSession.insert("addressMapper.insertAddress", submitEmpNo);
	}
	
	
	public int deleteAddress(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.delete("addressMapper.deleteAddress", empNo);
	}

}
