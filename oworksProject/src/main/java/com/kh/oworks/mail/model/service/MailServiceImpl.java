package com.kh.oworks.mail.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.employee.model.vo.Employee;
import com.kh.oworks.mail.model.vo.Mail;

@Service
public class MailServiceImpl implements MailService{

	@Override
	public ArrayList<Employee> searchEmp(String search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int sendMail(Mail m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectListCount(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Mail> selectList(PageInfo pi, HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMail(Mail m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReadTime(String mailNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
