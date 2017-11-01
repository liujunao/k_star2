package com.springmvc.common;

import javax.mail.*;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

/**
 * Created by lenovo on 2017/10/2.
 */
public class SendEmail {

    public void sendMail(String to,String text){
        //创建连接对象，连接到邮件服务器
        Properties properties = new Properties();
        //设置发送邮件的基本参数
        properties.put("mail.transport.protocol","smtp");//连接协议
        properties.put("mail.smtp.host","smtp.qq.com");//主机名
        properties.put("mail.smtp.port","465");//端口号
        properties.put("mail.smtp.auth","true");
        properties.put("mail.smtp.ssl.enable","true");//设置是否使用ssl连接

//        properties.put("mail.debug","true");//设置是否显示debug信息，true会在控制台显示

        //得到回话对象
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("1713507920@qq.com","liujunao153");
            }
        });
        //创建邮箱对象
        Message message = new MimeMessage(session);
        //设置发件人
        try {
            message.setFrom(new InternetAddress("1713507920@qq.com"));
            //设置收件人
            message.setRecipient(RecipientType.TO,new InternetAddress(to));
            //设置邮件标题
            message.setSubject("注册邮件验证");
            //设置时间
            message.setSentDate(new Date());
            //设置邮件内容
            message.setContent(text,"text/html;charset=UTF-8");
            //得到邮差对象
            Transport transport = session.getTransport();
            //连接到自己的邮箱账户
            transport.connect("1713507920@qq.com","sxetqgpcvnahecfa");
            //发送邮件
            transport.sendMessage(message,message.getAllRecipients());
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
