package animal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import animal.vo.LoginCommand;

@Controller
public class MainController {

	
	@RequestMapping("/")
	public String main2(Model model) {
		
		
		model.addAttribute("loginCommand", new LoginCommand());
		return "main"; //	/WEB-INF/views/   +main  +.jsp 로이동하라 
	}
	@RequestMapping("/main")
	public String main(Model model) {
		
		
		model.addAttribute("loginCommand", new LoginCommand());
		return "main"; //	/WEB-INF/views/   +main  +.jsp 로이동하라 
	}
	
	
}
