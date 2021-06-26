package com.kh.oworks.employee.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Department {

	private String deptCode;
	private String deptName;
	private String deptStatus;
}
