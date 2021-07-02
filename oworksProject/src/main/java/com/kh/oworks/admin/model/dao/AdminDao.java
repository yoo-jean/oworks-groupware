package com.kh.oworks.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oworks.admin.model.vo.Admin;
import com.kh.oworks.common.model.vo.PageInfo;

@Repository
public class AdminDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
				return sqlSession.selectOne("adminMapper.selectListCount");
	}
	
	public ArrayList<Admin> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectList", null, rowBounds);
		
	}

}
