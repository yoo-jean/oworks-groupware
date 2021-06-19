package com.kh.oworks.approval.model.vo;

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

public class ApprovalComment {

	private int commentCode;
	private String appNo;
	private String empName;
	private int empNo;
	private String appComment;
	private String commentDate;
}
