package com.kh.oworks.address.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oworks.address.model.vo.AddressOut;
import com.kh.oworks.common.model.vo.PageInfo;

@Repository
public class AddressOutDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("addressOutMapper.selectListCount");
	}
	
	// 전체 조회
	public ArrayList<AddressOut> selectAddressOutList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("addressOutMapper.selectAddressOutList", null, rowBounds);
		
	}
	
	
	// insert
	public int insertAddressOut(SqlSessionTemplate sqlSession, AddressOut ao) {
		return sqlSession.insert("addressOutMapper.insertAddressOut", ao);
	}
	
	
	// delete
	public int deleteAddressOut(SqlSessionTemplate sqlSession, int addOutNo) {
		return sqlSession.update("addressOutMapper.deleteAddressOut", addOutNo);
	}
	
	
	// update
	public int updateAddressOut(SqlSessionTemplate sqlSession, AddressOut ao) {
		return sqlSession.update("addressOutMapper.updateAddressOut", ao);
	}

}
