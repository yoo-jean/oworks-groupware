package com.kh.oworks.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ChatPerson {

	private int chatNo;				// CHAT_NO
	private String chatPerson;		// CHAT_PERSON
	private String chatMaker;		// CHAT_MAKER
	private String createDate;			// CREATE_DATE
	private String deleteDate;			// DELETE_DATE
	

}
