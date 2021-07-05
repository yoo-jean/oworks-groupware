package com.kh.oworks.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oworks.chat.model.vo.Chat;

@Repository
public class ChatDao {
	
	public ArrayList<Chat> selectChatList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatList", null);
		
	}

}
