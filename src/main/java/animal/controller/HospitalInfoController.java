package animal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import animal.dao.AnimalDao;
import animal.vo.HospitalInfo;

@Controller
public class HospitalInfoController {

	private AnimalDao animalDao;
	
	@Autowired
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	@GetMapping("hospitalInfo")
	public String HospitalList(Model model) {
		
		List<HospitalInfo> hospitalList = animalDao.selectAllHospital();
		model.addAttribute("hospitals", hospitalList);
		return "hospitalInfo/hospitalList";
	}
}
