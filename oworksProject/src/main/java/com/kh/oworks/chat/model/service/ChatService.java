package com.kh.oworks.chat.model.service;

import java.util.ArrayList;

import com.kh.oworks.chat.model.vo.Chat;

public interface ChatService {

	// 리스트 조회
	ArrayList<Chat> selectChatList();
	
	// insert
	int insertChat(Chat ch);
	
	// delete
	int deleteChat(int chatNo);
}
