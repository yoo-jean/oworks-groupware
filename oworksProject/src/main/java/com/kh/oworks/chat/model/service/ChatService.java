package com.kh.oworks.chat.model.service;

import java.util.ArrayList;

import com.kh.oworks.chat.model.vo.Chat;
import com.kh.oworks.chat.model.vo.ChatBubble;
import com.kh.oworks.chat.model.vo.ChatPerson;

public interface ChatService {

	// 리스트 조회
	ArrayList<Chat> selectChatList();
	
	// 해당 대화방에 딸린 말풍선 조회
	ArrayList<ChatBubble> selectBubbleList(int chatNo);
	
	// 메시지 보내기
	int insertBubble(ChatBubble cb);
	
	// 챗 펄슨 조회
	ArrayList<ChatPerson> selectChatPersonList();
	
	// 챗 버블 조회
	ArrayList<ChatBubble> selectChatBubbleList();
}
