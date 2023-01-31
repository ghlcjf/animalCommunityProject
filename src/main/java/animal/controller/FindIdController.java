package animal.controller;


import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
	
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

	@RequestMapping(value="/idFind",produces = "application/text; charset=UTF-8")
	public String findId(FindCommand fc, Model model) {
		
		String id = animalDao.findId(fc);
		System.out.println(id);	
		if(id==null) {
			return "이메일 또는 전화번호가 일치하지 않습니다.";
		}
		
		return id;
	}
	
	@RequestMapping(value="/pwFind",produces = "application/text; charset=UTF-8")
	public String findPw(FindCommand fc, HttpSession session) throws Exception{
		
		User user = animalDao.findPw(fc);
		
		if(user!=null) {
			Random r = new Random(); 
			int num = r.nextInt(999999);
			user.setPassword(Integer.toString(num));
			mailService.welcomeMailSend(user);
			
			animalDao.findPassword(user);
		  
			return "이메일로 임시비밀번호를 보냈습니다.";
		}else {
			
			return "아이디또는 이메일이 일치하지 않습니다.";
		}
		
	}
}
