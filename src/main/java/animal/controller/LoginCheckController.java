package animal.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import animal.dao.AnimalDao;
import animal.vo.User;

@RestController
public class LoginCheckController {

	private AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	@PostMapping("/loginCheck")
	public void loginAlert(@RequestParam("id") String id,
			@RequestParam("password") String password,
			HttpServletResponse response,
			Model model) throws IOException {
		
		User user = new User();
		user.setId(id);
		user.setPassword(password);
		
		User loginUser = 

		if (session.getAttribute(")) {
			
		}
		
	}
}
