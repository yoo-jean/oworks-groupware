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
public class ApprovalLine {

	private String appNo;
	private String empNo;
	private String refer;
	private int appOrder;
	private String appStatus;
	private String appOpinion;
	private String appDate;
}
