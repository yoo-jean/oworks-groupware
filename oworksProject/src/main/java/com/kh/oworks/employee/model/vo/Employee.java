package com.kh.oworks.employee.model.vo;

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
public class Employee {

	private int empNo;
	private String deptCode;
	private String deptName;
	private String jobCode;
	private String jobName;
	private String empName;
	private String empId;
	private String empPwd;
	private String birthNo;
	private String gender;
	private String email;
	private String phone;
	private String empPhone;
	private String address;
	private Date hireDate;
	private Date retireDate;
	private String empStatus;
	private String empImage;
	private int offGiven;
	private int offAvailable;
	private String adminYn;
	
}
