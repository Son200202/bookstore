package com.bookstore.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import java.util.Properties;
@Component
public class ConfirmPayment {
    @Autowired
    ServletContext context;

    @Autowired
    JavaMailSender mailSender;


    public void ConfirmPayment1(int Ma_DH,String userEmail)
    {
        
        try{
        	MimeMessage message = mailSender.createMimeMessage();
    		MimeMessageHelper helper = new MimeMessageHelper(message);

    		try {
    			helper.setFrom("no-reply-email");
    			helper.setTo(userEmail);
    			helper.setSubject("BOOK STORE, Đặt hàng thành công!");
    			helper.setText("Bạn đã đặt dơn hàng thàng công, "
    					+ "tra cứu thông tin đơn hàng có mã: " + Ma_DH + " để kiểm tra thông tin");
    		} catch (MessagingException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		mailSender.send(message);
    		
        }
        catch(Exception ex){
            System.out.println("SendingEmail..."+ex);
        }
    }
}
