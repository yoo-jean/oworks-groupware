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

public class Notice {
	private int noticeNo;
	private String empNo;
	private String empName;
	private String noticeTitle;
	private String noticeContent;
	private Date enrollDate;
	private Date modifyDate;
	private int noticeCount;
	private String noticeStatus;
}
