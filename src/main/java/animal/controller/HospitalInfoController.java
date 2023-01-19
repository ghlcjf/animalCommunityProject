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
			
		} else if (location.equals("gyeonggi")) {
			hospitalList = animalDao.selectHospitalGyeonggi();
			
		} else if (location.equals("gangwon")) {
			hospitalList = animalDao.selectHospitalGangwon();
			
		} else if (location.equals("chungcheong")) {
			hospitalList = animalDao.selectHospitalChungcheong();
			
		} else if (location.equals("gyeongsang")) {
			hospitalList = animalDao.selectHospitalGyeongsang();
			
		} else if (location.equals("jeolla")) {
			hospitalList = animalDao.selectHospitalJeolla();
			
		} else if (location.equals("jeju")) {
			hospitalList = animalDao.selectHospitaljeju();
		}
		
		for(int i=0;i<hospitalList.size();i++) {
			if(hospitalList.get(i).getHospitalName().length()>=26) {
				String title = hospitalList.get(i).getHospitalName().substring(0,26)+"...";
				hospitalList.get(i).setHospitalName(title);
			}
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
