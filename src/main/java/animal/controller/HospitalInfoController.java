package animal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import animal.dao.AnimalDao;
import animal.vo.HospitalInfo;

@Controller
public class HospitalInfoController {

	private AnimalDao animalDao;
	
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
