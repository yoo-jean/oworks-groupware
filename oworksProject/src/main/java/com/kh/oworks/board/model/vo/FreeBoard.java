package com.kh.oworks.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class FreeBoard {
	private int fbNo;
	private String empNo;
	private String empName;
	private String fbTitle;
	private String fbContent;
	private Date fbDate;
	private int fbCount;
	private String fbStatus;
	
}
