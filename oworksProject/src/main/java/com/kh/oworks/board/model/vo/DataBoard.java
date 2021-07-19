package com.kh.oworks.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class DataBoard {
	
	private int boardNo;			// DB_NO
	private String boardTitle;		// DB_TITLE
	private String boardContent;	// DB_CONTENT
	private String boardWriter;		// DB_WRITER
	private String writerName;
	private int empNo;
	private int count;				// COUNT
	private String createDate;		// CREATE_DATE
	private String originName;		// ORIGIN_NAME
	private String changeName;		// CHANGE_NAME
	private String status;			// STATUS
	


}
