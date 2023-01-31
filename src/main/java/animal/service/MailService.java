package animal.service;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;

import animal.dao.AnimalDao;
import animal.vo.User;

public class MailService {

	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	public void sendEmail(User user) throws Exception{
		
		String str = user.getPassword();
		// Mail Server 설정
		System.out.println(str);
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "whdudqls2666@gmail.com"; // 관리자 이메일 아이디
		String hostSMTPpw = "cho10536!"; // 관리자 이메일 비밀번호
		
		// 보내는 사람
		String fromEmail="whdudqls2666@gmail.com";
		String fromName="반려동물 커뮤니티";
		
		String subject = "[반려동물 커뮤니티] 임시비밀번호 안내 이메일 입니다. ";
		String msg = "안녕하세요. [반려동물 커뮤니티] 임시비밀번호 안내 관련 이메일입니다."+System.getProperty("line.separator")
				+"임시비밀번호는 "+str+"입니다."+System.getProperty("line.separator")
				+"로그인 후 비밀번호를 변경해주세요.";
		
		//email 전송
		String mailRecipient = user.getEmail();
		try {
			// 객체 선언
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSL(true);
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(465);
			mail.setAuthentication(hostSMTPid, hostSMTPpw);
			mail.setStartTLSRequired(true);
			mail.setTLS(true);
			mail.addTo(mailRecipient,charSet);
			mail.setFrom(fromEmail,fromName,charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
		}catch(Exception e) {
			System.out.println("메일발송 실패 : "+e);
		}
	}
	public void findPw(HttpServletResponse response,User user) {
		response.setContentType("text/html;charset=utf-8");
		
	}
}
