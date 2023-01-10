package animal.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import animal.dao.AnimalDao;
import animal.exception.MemberNotFoundException;
import animal.vo.AnimalInfo;
import animal.vo.HospitalInfo;

@Controller
public class HospitalInfoController {

	private AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	@GetMapping("hospitalInfo/{location}")
	public String HospitalList(@PathVariable("location") String location ,Model model) {
		List<HospitalInfo> hospitalList = null;
		
		if(location.equals("main")) {
			hospitalList = animalDao.selectAllHospital();
		} else if(location.equals("seoul")) {
			hospitalList = animalDao.selectHospitalSeoul();
		} else if (location.equals("gyeongi")) {
			hospitalList = animalDao.selectHospitalGyeongi();
		} else if (location.equals("incheon")) {
			hospitalList = animalDao.selectHospitalIncheon();
		} else if (location.equals("daejeon")) {
			hospitalList = animalDao.selectHospitalDaejeon();
		}
		
		model.addAttribute("hospitals", hospitalList);
		
		return "hospitalInfo/hospitalList";
	}
	
	@GetMapping("/hospital/detail/{boardNum}")
	public String detail(@PathVariable("boardNum") long boardNum, Model model) {
		
		HospitalInfo hospitalInfo = animalDao.selectByHospitalNum(boardNum);
		
		if (hospitalInfo == null) {
			throw new MemberNotFoundException();
		}
		
		model.addAttribute("hospitals", hospitalInfo);
		
		return "hospitalInfo/hospitalDetail";
	}
	
	
}
