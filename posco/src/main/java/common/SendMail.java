package common;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

public class SendMail extends MailConfig{//부모에게이는 메소드를 상속받는
	public void send(String from, String to, String subject,String content) {
		Properties props = System.getProperties();
		props.put("mail.smtp.host", HOST);
		props.put("mail.smtp.port", PORT);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", HOST);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(USER_NAME, PASSWORD);
			}
		});
		session.setDebug(true); // for debug

		Message mimeMessage = new MimeMessage(session);
		try {

			mimeMessage.setFrom(new InternetAddress(from));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			mimeMessage.setSubject(subject);
			mimeMessage.setContent(content,"text/html; charset=UTF-8");
			Transport.send(mimeMessage);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
