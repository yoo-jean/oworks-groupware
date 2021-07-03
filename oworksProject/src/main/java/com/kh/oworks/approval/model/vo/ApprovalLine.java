package com.kh.oworks.approval.model.vo;

import java.util.ArrayList;

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

	private String appNo;		// 문서번호
	private int empNo;			// 사원번호
	private String refer;		// 결재 || 참조
	private int appOrder;		// 결재순서
	private String appStatus;	// 결재상태
	private String appOpinion;	// 결재의견
	private String appDate;		// 결재일
	private String status; 		// 결재상태 대기|진행|반려|완료
	
	private String appTitle;
	private String writeDate;
	private String empName;
	private String appContent;
	
	private ArrayList<ApprovalLine> lineList;
	
	private int approvalEmpNo;
	
}
