package com.wwe.member.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator{

	PasswordAuthentication pa;
	
	public MailAuth() {
		String mail_id = "khwweproject";
		String mail_pw = "1q21q21q2!";
	
		pa = new PasswordAuthentication(mail_id, mail_pw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}
