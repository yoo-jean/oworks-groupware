package com.kh.oworks.employee.model.service;

import com.kh.oworks.employee.model.vo.Employee;

public interface EmployeeService {
	
	// 1. 사원 로그인용 서비스
	Employee loginEmployee(Employee e);
	
	// 2. 사원 정보수정용 서비스
	int updateEmployee(Employee e);
}
