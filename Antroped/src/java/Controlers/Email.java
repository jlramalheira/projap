package Controlers;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class Email {

    private static String fromAddress = "antroped@gmail.com"; 
    private static String name = "Antroped";
    private static String password = "projrenato";
    private static String host = "smtp.gmail.com";
    private static String port = "465";
    private static String socketFactory = "javax.net.ssl.SSLSocketFactory";
    private static String auth = "true";
    private static String fallBack = "false";

    public static void setConfig(String fromAddress, String name, String password, String host, String port, String socketFactory, String auth, String fallBack) {
        Email.name = name;
        Email.fromAddress = fromAddress;
        Email.password = password;
        Email.host = host;
        Email.port = port;
        Email.socketFactory = socketFactory;
        Email.auth = auth;
        Email.fallBack = fallBack;
    }

    public static void sendEmail(String toAddress, String subject, String text) throws UnsupportedEncodingException, MessagingException {

        Properties props = new Properties();
        props.put("mail.smtp.auth", auth);
        props.put("mail.smtp.port", port);
        props.put("mail.host", host);
        props.put("mail.smtp.socketFactory.class", socketFactory);
        props.put("mail.smtp.socketFactory.fallback", fallBack);

        Session session = Session.getInstance(props, getAuthenticator());

        InternetAddress from = new InternetAddress(fromAddress, name);

        MimeMessage message = new MimeMessage(session);

        message.setFrom(from);
        message.addRecipients(Message.RecipientType.TO, toAddress);

        message.setSubject(subject);

        message.setText(text);

        Transport.send(message);
    }

    private static Authenticator getAuthenticator() {
        Authenticator authenticator = new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromAddress, password);
            }
        };
        return authenticator;
    }

}
