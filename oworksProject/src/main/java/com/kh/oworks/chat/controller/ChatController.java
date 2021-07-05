package com.kh.oworks.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oworks.chat.model.service.ChatService;
import com.kh.oworks.chat.model.vo.Chat;


@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;
	

	@RequestMapping("list.ch")
	public String selectChatList(Model model) {
		
		ArrayList<Chat> list = cService.selectChatList();
			
			model.addAttribute("list", list);
			return "chat/chatListView";
			
	}
	
	
	

}
