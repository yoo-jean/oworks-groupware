package com.kh.oworks.admin.model.vo;

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
public class Admin {
	
	private Date workDate;
	private String deptName;
	private int empNo;
	private String empName;
	private Date startTime;
	private Date endTime;
	private String workTime;
	private String afterTime;
	private String workStatus;
	
	// 관리자 휴가분류
	private int offCateNo;
	private String offCateName;
	private int offCateDay;
	
	// 관리자 근태통계
	private String offGiven;
	private String offUsed;
	private String offAvailable;

}
