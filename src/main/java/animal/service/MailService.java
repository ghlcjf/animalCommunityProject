package animal.service;

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

import animal.dao.AnimalDao;
import animal.vo.MailAuth;
import animal.vo.User;

public class MailService {

	private AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	public void welcomeMailSend(User user) {

		Properties prop = System.getProperties();
		
        // 로그인시 TLS를 사용할 것인지 설정
		prop.put("mail.smtp.starttls.enable", "true");
        
		// 이메일 발송을 처리해줄 SMTP서버
		prop.put("mail.smtp.host", "smtp.gmail.com");
        
		// SMTP 서버의 인증을 사용한다는 의미
		prop.put("mail.smtp.auth", "true");
        
		// TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Authenticator auth = new MailAuth();

		Session session = Session.getDefaultInstance(prop, auth);

		MimeMessage msg = new MimeMessage(session);

		try {
			// 보내는 날짜 지정
			msg.setSentDate(new Date());

			// 발송자를 지정한다. 발송자의 메일, 발송자명 ***메일 입력해야 이메일 발송 가능
			msg.setFrom(new InternetAddress("", "[반려동물 커뮤니티]"));
			
            // 수신자의 메일을 생성한다.
			InternetAddress to = new InternetAddress(user.getEmail());
			
            // Message 클래스의 setRecipient() 메소드를 사용하여 수신자를 설정한다. setRecipient() 메소드로 수신자, 참조,
			// 숨은 참조 설정이 가능하다.
			// Message.RecipientType.TO : 받는 사람
			// Message.RecipientType.CC : 참조
			// Message.RecipientType.BCC : 숨은 참조
			msg.setRecipient(Message.RecipientType.TO, to);
			
            // 메일의 제목 지정
			msg.setSubject("안녕하세요. [반려동물 커뮤니티] 임시비밀번호 안내 관련 이메일입니다.", "UTF-8");
			
            // Transport는 메일을 최종적으로 보내는 클래스로 메일을 보내는 부분이다.
			msg.setText("안녕하세요. [반려동물 커뮤니티] 임시비밀번호 안내 관련 이메일입니다."+System.getProperty("line.separator")
						+"임시비밀번호는 "+user.getPassword()+"입니다."+System.getProperty("line.separator")
						+"로그인 후 비밀번호를 변경해주세요.", "UTF-8");

			Transport.send(msg);
			System.out.println("완료");

		} catch (AddressException ae) {
			System.out.println("AddressException : " + ae.getMessage());
		} catch (MessagingException me) {
			System.out.println("MessagingException : " + me.getMessage());
		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		}
	}
	
	public void emailCertificateNum(String email, int num) {

		Properties prop = System.getProperties();
		
        // 로그인시 TLS를 사용할 것인지 설정
		prop.put("mail.smtp.starttls.enable", "true");
        
		// 이메일 발송을 처리해줄 SMTP서버
		prop.put("mail.smtp.host", "smtp.gmail.com");
        
		// SMTP 서버의 인증을 사용한다는 의미
		prop.put("mail.smtp.auth", "true");
        
		// TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Authenticator auth = new MailAuth();

		Session session = Session.getDefaultInstance(prop, auth);

		MimeMessage msg = new MimeMessage(session);

		try {
			// 보내는 날짜 지정
			msg.setSentDate(new Date());

			// 발송자를 지정한다. 발송자의 메일, 발송자명
			msg.setFrom(new InternetAddress("whdudqls2666@gmail.com", "[반려동물 커뮤니티]"));
			
            // 수신자의 메일을 생성한다.
			InternetAddress to = new InternetAddress(email);
			
            // Message 클래스의 setRecipient() 메소드를 사용하여 수신자를 설정한다. setRecipient() 메소드로 수신자, 참조,
			// 숨은 참조 설정이 가능하다.
			// Message.RecipientType.TO : 받는 사람
			// Message.RecipientType.CC : 참조
			// Message.RecipientType.BCC : 숨은 참조
			msg.setRecipient(Message.RecipientType.TO, to);
			
            // 메일의 제목 지정
			msg.setSubject("안녕하세요. [반려동물 커뮤니티] 이메일 인증번호입니다.", "UTF-8");
			
            // Transport는 메일을 최종적으로 보내는 클래스로 메일을 보내는 부분이다.
			msg.setText("안녕하세요. [반려동물 커뮤니티] 이메일 인증번호 이메일입니다."+System.getProperty("line.separator")
						+"인증번호는 "+num+"입니다."+System.getProperty("line.separator")
						+"회원가입을 축하드립니다.", "UTF-8");

			Transport.send(msg);
			System.out.println("완료");

		} catch (AddressException ae) {
			System.out.println("AddressException : " + ae.getMessage());
		} catch (MessagingException me) {
			System.out.println("MessagingException : " + me.getMessage());
		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		}
	}
}
