package com.kh.oworks.address.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Address {
	
	private int empNo; 		// EMP_NO (로그인된 사람)
	private int favEmpNo;   // FAVEMP_NO (리스트에 있는 사람)
	
	private String empName;
	private String email;
	private String empPhone;
	private String phone;
	private String dept;
	private String job;

}
