package com.Eanvan.async;

import com.Eanvan.utils.MyConstant;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

import javax.mail.Address;
import javax.mail.internet.MimeMessage;

public class MailTask implements Runnable {

    private String code;
    private String email;
    private JavaMailSender javaMailSender;
    private int operation;
    private Address address;

    public MailTask(String code, String email, JavaMailSender javaMailSender, int operation) {
        this.code = code;
        this.email = email;
        this.javaMailSender = javaMailSender;
        this.operation = operation;
    }

    @Override
    public void run() {
        /*new MimeMessagePreparator() 使用lambda代替了使用new一个匿名对象的方式，直接进行了变量的传递*/
        javaMailSender.send(mimeMessage -> {
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
            mimeMessageHelper.setFrom(MyConstant.MAIL_FROM);
            mimeMessageHelper.setTo(email);
            mimeMessageHelper.setSubject("一封来自Eanvan的测试激活邮件");
            StringBuilder sb = new StringBuilder();
            sb.append("<html><head></head><body>");

            switch (operation) {
                case 1:
                    sb.append("<a href="+MyConstant.DOMAIN_NAME+"activate.do?code=");
                    sb.append(code);
                    sb.append(">点击激活</a></body>");
                    break;
                case 2:
                     break;
            }
            mimeMessageHelper.setText(sb.toString(),true);
            System.out.println("邮件发送结束");
        });
    }
}
