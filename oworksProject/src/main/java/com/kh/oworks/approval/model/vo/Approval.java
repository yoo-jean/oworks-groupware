package com.kh.oworks.approval.model.vo;

import java.util.ArrayList;
import java.util.List;

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

public class Approval {

	private String appNo;
	private int empNo;
	private String empName;
	private String formNo;
	private String appType;
	private String appTitle;
	private String appContent;
	private String writeDate;
	private String appStatus;
	private String appStorage;
	private String deleteStatus;
	private String deleteReason;
	private String appDate;
	private String orgFileName;
	private String mdfFileName;
	private String filePath;
	private String formName;
	private String expireDate;
	private String securityLevel;
	private int appcount;
	private String deptName;
	private String jobName;
	private String status;
	
	private ArrayList<ApprovalLine> lineList;
	private ArrayList<Approval>updateList;
	
	private int approvalEmpNo;
}
