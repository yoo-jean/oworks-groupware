package com.kh.oworks.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oworks.chat.model.dao.ChatDao;
import com.kh.oworks.chat.model.vo.Chat;
import com.kh.oworks.chat.model.vo.ChatBubble;
import com.kh.oworks.chat.model.vo.ChatPerson;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ChatDao cDao;

	@Override
	public ArrayList<Chat> selectChatList() {
		return cDao.selectChatList(sqlSession);
	}

	@Override
	public ArrayList<ChatBubble> selectBubbleList(int chatNo) {
		return cDao.selectBubbleList(sqlSession, chatNo);
	}

	@Override
	public int insertBubble(ChatBubble cb) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<ChatPerson> selectChatPersonList() {
		return cDao.selectChatPersonList(sqlSession);
	}

	@Override
	public ArrayList<ChatBubble> selectChatBubbleList() {
		return cDao.selectChatBubbleList(sqlSession);
	}

	




}
