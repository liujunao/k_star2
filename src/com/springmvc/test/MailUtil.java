package com.springmvc.test;

import javax.mail.*;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * Created by lenovo on 2017/10/2.
 */
public class MailUtil {

    public void sendMail(String to,String text) throws MessagingException {
        //创建连接对象，连接到邮件服务器
        Properties properties = new Properties();
        //设置发送邮件的基本参数
        properties.put("mail.transport.protocol","smtp");
        properties.put("mail.smtp.host","smtp.qq.com");
        properties.put("mail.smtp.port","465");
        properties.put("mail.smtp.auth","true");
        properties.put("mail.smtp.ssl.enable","true");

        properties.put("mail.debug","true");

        //设置发送邮箱的账号和密码
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("1713507920@qq.com","liujunao153");
            }
        });
        //创建邮箱对象
        Message message = new MimeMessage(session);
        //设置发件人
        message.setFrom(new InternetAddress("1713507920@qq.com"));
        //设置收件人
        message.setRecipient(RecipientType.TO,new InternetAddress(to));
        //设置主题
        message.setSubject("这是一份测试邮件");
        message.setContent(text,"text/html;charset=UTF-8");
//        Transport.send(message);
        //得到邮差对象
        Transport transport = session.getTransport();
        transport.connect("1713507920@qq.com","idkhanjtriadfahg");
        transport.sendMessage(message,message.getAllRecipients());
    }

    public static void main(String[] args){
        MailUtil mailUtil = new MailUtil();
        try {
            mailUtil.sendMail("719191609@qq.com",String.valueOf(Math.random() * 999));
            System.out.println("邮件发送成功！");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
