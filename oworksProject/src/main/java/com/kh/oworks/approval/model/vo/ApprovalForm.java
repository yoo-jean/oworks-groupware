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

public class ApprovalForm {

	private String formNo;
	private String formName;
	private String formExplain;
	private String expireDate;
	private String securityLevel;
	private String status;
}
