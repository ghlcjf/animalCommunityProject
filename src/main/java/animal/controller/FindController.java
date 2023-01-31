package animal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import animal.dao.AnimalDao;
import animal.vo.FindIdCommand;

@Controller
public class FindController {

	AnimalDao animalDao = new AnimalDao();

	@Autowired
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	@GetMapping("/findIdForm")
	public String findIdForm(Model model) {
		
		model.addAttribute("findIdCommand",new FindIdCommand());
		
		return "find/findIdForm";
	}
	
}
