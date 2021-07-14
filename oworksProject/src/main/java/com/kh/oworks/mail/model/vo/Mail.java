package com.kh.oworks.mail.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Mail {
	
	private int mailNo;
	private int sempNo;
	private int rempNo;
	private String sempName;
	private String rempName;
	private String mailType;
	private String mailTitle;
	private String mailContent;
	private Date readDate;
	private Date sendDate;
	private String smailStatus;
	private String rmailStatus;
}
