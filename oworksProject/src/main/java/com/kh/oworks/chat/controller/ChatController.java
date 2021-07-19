package com.kh.oworks.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.oworks.chat.model.service.ChatService;
import com.kh.oworks.chat.model.vo.Chat;
import com.kh.oworks.chat.model.vo.ChatBubble;
import com.kh.oworks.chat.model.vo.ChatPerson;


@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;
	

	@RequestMapping("list.ch")
	public String selectChatList(Model model) {
		
		ArrayList<Chat> list = cService.selectChatList();
		ArrayList<ChatPerson> chatPersonList = cService.selectChatPersonList();
		ArrayList<ChatBubble> chatBubbleList = cService.selectChatBubbleList();
			
			model.addAttribute("list", list);
			model.addAttribute("chatPersonList", chatPersonList);
			model.addAttribute("chatBubbleList", chatBubbleList);
			return "chat/chatListView";
			
	}
	
	
	@ResponseBody
	@RequestMapping(value="blist.ch", produces="application/json; charset=utf-8")
	public String ajaxSelectBubbleList(int chatNo) {
		
		//ArrayList<ChatBubble> list = cService.selectBubbleList(chatNo);
		//return new Gson().toJson(list);
		return new Gson().toJson(cService.selectBubbleList(chatNo));
	}
	
	
	@RequestMapping("insert.ch")
	public String ajaxInsertBubble(ChatBubble cb) {
		
	}
	
	

	
	
	
	
	

}
