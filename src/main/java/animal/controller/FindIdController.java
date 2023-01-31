package animal.controller;

import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mchange.net.MailSender;

import animal.dao.AnimalDao;
import animal.service.MailService;
import animal.vo.FindCommand;
import animal.vo.User;

@RestController
public class FindIdController {

	private AnimalDao animalDao;
	@Autowired
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	private MailService mailService;
	@Autowired
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

	@RequestMapping(value="/idFind",produces = "application/text; charset=UTF-8")
	public String findId(FindCommand fc, Model model) {
			
		String id = animalDao.findId(fc);
		
		if(id==null) {
			return "이메일 또는 전화번호가 일치하지 않습니다.";
		}
		
		return id;
	}
	
	@RequestMapping(value="/pwFind",produces = "application/text; charset=UTF-8")
	public String findPw(FindCommand fc, HttpSession session) throws Exception{
		
		User user = animalDao.findPw(fc);
		System.out.println(user.getEmail());
		
		
		if(user.getEmail()!=null) {
			Random r = new Random();
			int num = r.nextInt(999999);
			
			user.setPassword(Integer.toString(num));
			
			MailService mail = new MailService();
			mail.sendEmail(user);
			
				
			
		}
		
	
		
		 
		 
		 
		
		
		return "/main";
		
	}
}
