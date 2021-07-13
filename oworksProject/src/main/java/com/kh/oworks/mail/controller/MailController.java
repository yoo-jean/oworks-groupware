package com.kh.oworks.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oworks.mail.model.service.MailService;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
	@RequestMapping("write.mail")
	public String writeMail() {
		return "mail/mailWrite";
	}
	
	@RequestMapping("receive.mail")
	public String receiveMail() {
		return "mail/mailReceive";
	}
	
	@RequestMapping("send.mail")
	public String sendMail() {
		return "mail/mailSend";
	}
	
	@RequestMapping("toMe.mail")
	public String toMeMail() {
		return "mail/mailToMe";
	}
	
	@RequestMapping("trash.mail")
	public String trashMail() {
		return "mail/mailTrash";
	}


}
