package animal.controller;

import java.io.IOException;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import animal.service.LoginCheckService;
import animal.vo.User;

@RestController
public class LoginCheckController {
	
	private LoginCheckService loginCheckService;
	
	public void setLoginCheckService(LoginCheckService loginCheckService) {
		this.loginCheckService = loginCheckService;
	}


	
	@PostMapping("/loginCheck")
	public boolean loginCheck(@RequestParam("id") String id,
			@RequestParam("password") String password, Model model) throws IOException {
		
		User user = new User();
		user.setId(id);
		user.setPassword(password);
		
		boolean loginCheck = loginCheckService.loginCheck(user);
		
		return loginCheck;
	}
	
	
		
}
