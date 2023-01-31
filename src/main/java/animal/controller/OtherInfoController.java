package animal.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import animal.dao.AnimalDao;
import animal.vo.User;

@Controller
public class OtherInfoController {
	
	private AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	@GetMapping("/member/detail/{name}")
	public String memberDetail(@PathVariable("name") String name, HttpSession session) {
		
		User user = animalDao
	}
}
