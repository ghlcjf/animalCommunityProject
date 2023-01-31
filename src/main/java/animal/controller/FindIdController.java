package animal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import animal.dao.AnimalDao;
import animal.vo.FindIdCommand;

@RestController
public class FindIdController {

	AnimalDao animalDao = new AnimalDao();

	@Autowired
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	@RequestMapping(value="/idFind",produces = "application/text; charset=UTF-8")
	public String findId(FindIdCommand fic, Model model) {
		
		String id = animalDao.findId(fic);
		
		if(id==null) {
			return "이메일 또는 전화번호가 일치하지 않습니다.";
		}
		
		
		return id;
	}
}
