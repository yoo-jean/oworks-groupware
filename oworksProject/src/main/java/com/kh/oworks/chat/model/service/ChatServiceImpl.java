package com.kh.oworks.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oworks.chat.model.dao.ChatDao;
import com.kh.oworks.chat.model.vo.Chat;

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
	public int insertChat(Chat ch) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteChat(int chatNo) {
		// TODO Auto-generated method stub
		return 0;
	}



}
