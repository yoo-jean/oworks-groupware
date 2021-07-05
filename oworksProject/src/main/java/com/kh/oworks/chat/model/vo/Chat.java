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
public class Chat {
	
	private int chatNo;			// CHAT_NO
	private String chatName;	// CHAT_NAME
	private String createDate;	// CREATE_DATE
	private String deleteDate;	// DELETE_DATE
	private String status;		// STATUS
	


}
