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
import animal.vo.SectionPage;

@Controller
public class AnimalInfoController {
	
	private AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	@RequestMapping("animalInfo/{section}/{pageNum}")
	public String animalList(@PathVariable("section") int section,
			@PathVariable("pageNum") int pageNum, Model model) {
		
		
		int totalCnt = animalDao.selectAllNumAnimalInfo();
		SectionPage sectionPage = new SectionPage(section,pageNum);
		List<AnimalInfo> animalList = animalDao.selectTargetAnimalInfoList(sectionPage);
	
		
		
		
		for(int i=0;i<animalList.size();i++) {
			if(animalList.get(i).getAnimalTitle().length()>=14) {
				String title = animalList.get(i).getAnimalTitle().substring(0,14)+"...";
				animalList.get(i).setAnimalTitle(title);
			}
		}
		model.addAttribute("sectionPage", sectionPage);
		model.addAttribute("totalCnt", totalCnt);
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
