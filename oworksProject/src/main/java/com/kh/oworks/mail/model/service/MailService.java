package com.kh.oworks.mail.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.oworks.common.model.vo.PageInfo;
import com.kh.oworks.employee.model.vo.Employee;
import com.kh.oworks.mail.model.vo.Mail;

public interface MailService {
	
	// 사원검색
	ArrayList<Employee> searchEmp(String search);
	
	// 메일전송
	int sendMail(Mail m);
	
	// 메일 리스트 조회
	int selectListCount(HashMap<String,String> map);
	ArrayList<Mail> selectList(PageInfo pi, HashMap<String,String> map);
	
	// 메일업데이트
	int updateMail(Mail m);
	
	// 메일 읽은시간 업데이트 
	int updateReadTime(String mailNo);
	
	
	
}
