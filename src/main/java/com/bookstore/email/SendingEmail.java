package com.bookstore.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import java.util.Properties;
@Component
public class SendingEmail {
    @Autowired
    ServletContext context;

    @Autowired
    JavaMailSender mailSender;


    public void SendingEmail1(String userEmail,String name,String code)
    {
        final String email="cuahangsachso6@gmail.com";
        final String pword="Tu18110387";
        try{
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true,"utf-8");
            helper.setFrom(email);
            helper.setTo(userEmail);
            helper.setReplyTo(email);
            helper.setSubject("BOOK STORE, Xác nhận tài khoản");
            String body= "<p>Mã xác nhân của bạn là: "+"<span>"+String.valueOf(code)+"</span></p>"
                    +"<p>Sử dụng mã trên để hoàn thành đăng kí tài khoản.</p>";;
            String text="Use this code: "+code+" to finished registation";
            helper.setText(body, true);
            mailSender.send(message);
        }
        catch(Exception ex){
            System.out.println("SendingEmail..."+ex);
        }
    }
}
    