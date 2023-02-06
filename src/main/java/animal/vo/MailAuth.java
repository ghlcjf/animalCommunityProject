package animal.vo;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator {
	
	 PasswordAuthentication pa;
	    
	    public MailAuth() {
	        String mail_id = ""; // 관리자 이메일
	        String mail_pw = ""; // 관리자 비밀번호(구글-> 앱 비밀번호)
	        
	        pa = new PasswordAuthentication(mail_id, mail_pw);
	    }
	    
	    public PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }
}
