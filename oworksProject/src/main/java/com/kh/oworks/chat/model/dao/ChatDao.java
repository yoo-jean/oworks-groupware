package com.kh.oworks.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oworks.chat.model.vo.Chat;
import com.kh.oworks.chat.model.vo.ChatBubble;
import com.kh.oworks.chat.model.vo.ChatPerson;

@Repository
public class ChatDao {
	
	public ArrayList<Chat> selectChatList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatList", null);
		
	}
	
	
	public ArrayList<ChatBubble> selectBubbleList(SqlSessionTemplate sqlSession, int chatNo){
		return (ArrayList)sqlSession.selectList("chatMapper.selectBubbleList", chatNo);
	}
	
	
	public ArrayList<ChatPerson> selectChatPersonList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("chatMapper.selectPersonList", null);
	
	}
	
	
	public ArrayList<ChatBubble> selectChatBubbleList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("chatMapper.selectCBubbleList", null);
	
	}

}
