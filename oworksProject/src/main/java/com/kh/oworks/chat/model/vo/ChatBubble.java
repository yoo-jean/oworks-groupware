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
public class ChatBubble {
	
	private int bubbleNo;			// BUBBLE_NO		말풍선 고유 번호
	private int refChatNo;			// REF_CNO			참조 대화방 번호
	private String bubbleMaker; 	// BUBBLE_MAKER		보낸 사람
	private String bubbleReceive; 	// BUBBLE_RECEIVE	받는 사람
	private String bubbleContent;	// BUBBLE_CONTENT	내용
	private String createTime;		// CREATE_DATE		생성 날짜(시간)
	private String readStatus;		// READ_STATUS		읽음 여부

	// chat_person
	//private String chatPerson;		// CHAT_PERSON
	//private String chatMaker;		// CHAT_MAKER
	//private String creDate;			// CREATE_DATE
	//private String delDate;			// DELETE_DATE

}
