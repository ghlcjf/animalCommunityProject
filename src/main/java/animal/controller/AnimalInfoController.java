package animal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import animal.dao.AnimalDao;
import animal.exception.MemberNotFoundException;
import animal.vo.AnimalInfo;

@Controller
public class AnimalInfoController {
	
	private AnimalDao animalDao;
	
	@Autowired
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	@RequestMapping("animalInfo")
	public String animalList(Model model) {
		
		List<AnimalInfo> animalList = animalDao.selectAllAniaml();
		model.addAttribute("animals", animalList);
		return "animalInfo/animalList";
	}
	
	@GetMapping("/animal/detail/{animalNum}")
	public String detail(@PathVariable("animalNum") long animalNum, Model model) {
		AnimalInfo updateAnimalInfo = animalDao.selectByNum(animalNum);
		animalDao.addViewCount(updateAnimalInfo);
		
		AnimalInfo animalInfo = animalDao.selectByNum(animalNum);
		
		if (animalInfo == null) {
			throw new MemberNotFoundException();
		}
		
		model.addAttribute("animal", animalInfo);
		
		return "animalInfo/animalDetail";
	}
	
}
