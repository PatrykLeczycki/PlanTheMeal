package pl.patlec.utils;

import org.springframework.stereotype.Component;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Properties;
import java.util.Scanner;

@Component
public class Mailer {

    public void send(String to, String sub, String msg) {

        String from = getData()[0];
        String pass = getData()[1];

        Properties props = new Properties();
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        //get Session
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from, pass);
                    }
                });
        //compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
//            message.setText(msg); // send email without format html
            message.setContent(msg, "text/html");
            Transport.send(message);
            System.out.println("message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public static String[] getData(){
        File file = new File("/home/patryk/Pulpit/pass.txt");

        //File file = new File("/password/data.txt");
        String[] data = new String[2];

        try (Scanner scan = new Scanner(file)) {
            //read lines from file
            data[0] = scan.nextLine();
            data[1] = scan.nextLine();
        } catch (FileNotFoundException e1) {
            e1.printStackTrace();
        }
        return data;
    }

}