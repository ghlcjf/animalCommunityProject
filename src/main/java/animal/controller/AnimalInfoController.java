package animal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
			@PathVariable("pageNum") int pageNum,
			@RequestParam("category") String category, Model model,HttpSession session) {
		
		
		
		SectionPage sectionPage = new SectionPage(section,pageNum);
		List<AnimalInfo> animalList = null;
		int totalCnt = 0;
		
		
		if(category.equals("main")) {
			totalCnt = animalDao.selectAllNumAnimalInfo();
			animalList = animalDao.selectTargetAnimalInfoList(sectionPage);
		}else if(category.equals("dog")) {
			sectionPage.setAnimalCategory("강아지");
			totalCnt = animalDao.selectAnimalNumAnimalInfo(sectionPage);
			animalList = animalDao.selectAnimalTargetAnimalInfoList(sectionPage);
		}else if(category.equals("cat")) {
			sectionPage.setAnimalCategory("고양이");
			totalCnt = animalDao.selectAnimalNumAnimalInfo(sectionPage);
			animalList = animalDao.selectAnimalTargetAnimalInfoList(sectionPage);
		}else if(category.equals("reptile")) {
			sectionPage.setAnimalCategory("파충류");
			totalCnt = animalDao.selectAnimalNumAnimalInfo(sectionPage);
			animalList = animalDao.selectAnimalTargetAnimalInfoList(sectionPage);
		}else if(category.equals("birds")) {
			sectionPage.setAnimalCategory("조류");
			totalCnt = animalDao.selectAnimalNumAnimalInfo(sectionPage);
			animalList = animalDao.selectAnimalTargetAnimalInfoList(sectionPage);
		}else if(category.equals("fish")) {
			sectionPage.setAnimalCategory("어류");
			totalCnt = animalDao.selectAnimalNumAnimalInfo(sectionPage);
			animalList = animalDao.selectAnimalTargetAnimalInfoList(sectionPage);
		}else if(category.equals("other")) {
			sectionPage.setAnimalCategory("기타");
			totalCnt = animalDao.selectAnimalNumAnimalInfo(sectionPage);
			animalList = animalDao.selectAnimalTargetAnimalInfoList(sectionPage);
		}
		
		
		
		
		for(int i=0;i<animalList.size();i++) {
			if(animalList.get(i).getAnimalTitle().length()>=10) {
				String title = animalList.get(i).getAnimalTitle().substring(0,10)+"...";
				animalList.get(i).setAnimalTitle(title);
			}
		}
		
		session.setAttribute("category", category);
		session.setAttribute("sectionPage", sectionPage);
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
