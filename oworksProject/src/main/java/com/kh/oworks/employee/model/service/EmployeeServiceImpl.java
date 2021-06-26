package com.kh.oworks.employee.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.oworks.employee.model.dao.EmployeeDao;
import com.kh.oworks.employee.model.vo.Employee;

@Component
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EmployeeDao eDao;

	@Override
	public Employee loginEmployee(Employee e) {
		return eDao.loginEmployee(sqlSession, e);
		
	}

	@Override
	public int updateEmployee(Employee e) {
		// TODO Auto-generated method stub
		return 0;
	}
	


}
