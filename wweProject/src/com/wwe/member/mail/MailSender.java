package com.wwe.member.mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;


public class MailSender {
	
	public void GmailSet(String user, String title, String content) {
		
		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 호스트
        p.put("mail.smtp.auth","true");
        p.put("mail.smtp.port", "587"); 

        Authenticator auth = new MailAuth();
        Session session = Session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
        String fromName = "KH_WWE";
        String charSet = "UTF-8";
        
        try {
        msg.setSentDate(new Date());
        
        InternetAddress from = new InternetAddress();
        from = new InternetAddress(new String(fromName.getBytes(charSet), "8859_1"));
        msg.setFrom(from);
        System.out.println("4");
        InternetAddress to = new InternetAddress(user); //받는 사람
        msg.setRecipient(Message.RecipientType.TO, to);
        
        msg.setSubject(title, "UTF-8"); // 메일제목
        msg.setText(content, "UTF-8"); // 메일 내용
        
        Transport.send(msg);
        System.out.println("5");
        }catch (AddressException addr_e) {  //예외처리 주소를 입력하지 않을 경우
            JOptionPane.showMessageDialog(null, "메일을 입력해주세요", "메일주소입력", JOptionPane.ERROR_MESSAGE);
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) { //메시지에 이상이 있을 경우
            JOptionPane.showMessageDialog(null, "메일을 제대로 입력해주세요.", "오류발생", JOptionPane.ERROR_MESSAGE);
            msg_e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        
	}
}
