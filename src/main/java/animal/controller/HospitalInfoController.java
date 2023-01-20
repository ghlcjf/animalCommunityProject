package animal.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import animal.dao.AnimalDao;
import animal.exception.MemberNotFoundException;
import animal.vo.HospitalInfo;
import animal.vo.SectionPage;

@Controller
public class HospitalInfoController {

	private AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	@GetMapping("hospitalInfo/{location}/{section}/{pageNum}")
	public String HospitalList(@PathVariable("location") String location, 
			@PathVariable("section") int section, 
			@PathVariable("pageNum") int pageNum, Model model) {
		List<HospitalInfo> hospitalList = null;
		int totalCnt = 0;
		SectionPage sectionPage = new SectionPage(section,pageNum);
		
		
		
		
		
		
		if(location.equals("main")) {
			totalCnt = animalDao.selectAllNumHospitalInfo();
			hospitalList = animalDao.selectTargetHospitalInfoList(sectionPage);
			
		} else if(location.equals("seoul")) {
			sectionPage.setHospitalLoc("서울");
			totalCnt = animalDao.selectLocationNumHospitalInfo(sectionPage);
			hospitalList = animalDao.selectLocationTargetHospitalList(sectionPage);
			
		} else if (location.equals("gyeonggi")) {
			sectionPage.setHospitalLoc("경기도");
			totalCnt = animalDao.selectLocationNumHospitalInfo(sectionPage);
			hospitalList = animalDao.selectLocationTargetHospitalList(sectionPage);
			
		} else if (location.equals("gangwon")) {
			sectionPage.setHospitalLoc("강원도");
			totalCnt = animalDao.selectLocationNumHospitalInfo(sectionPage);
			hospitalList = animalDao.selectLocationTargetHospitalList(sectionPage);
			
		} else if (location.equals("chungcheong")) {
			sectionPage.setHospitalLoc("충청도");
			totalCnt = animalDao.selectLocationNumHospitalInfo(sectionPage);
			hospitalList = animalDao.selectLocationTargetHospitalList(sectionPage);
			
		} else if (location.equals("gyeongsang")) {
			sectionPage.setHospitalLoc("경상도");
			totalCnt = animalDao.selectLocationNumHospitalInfo(sectionPage);
			hospitalList = animalDao.selectLocationTargetHospitalList(sectionPage);
			
		} else if (location.equals("jeolla")) {
			sectionPage.setHospitalLoc("전라도");
			totalCnt = animalDao.selectLocationNumHospitalInfo(sectionPage);
			hospitalList = animalDao.selectLocationTargetHospitalList(sectionPage);
			
		} else if (location.equals("jeju")) {
			sectionPage.setHospitalLoc("제주도");
			totalCnt = animalDao.selectLocationNumHospitalInfo(sectionPage);
			hospitalList = animalDao.selectLocationTargetHospitalList(sectionPage);
		}
		
		for(int i=0;i<hospitalList.size();i++) {
			if(hospitalList.get(i).getHospitalName().length()>=26) {
				String title = hospitalList.get(i).getHospitalName().substring(0,26)+"...";
				hospitalList.get(i).setHospitalName(title);
			}
		}
		model.addAttribute("location", location);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("sectionPage", sectionPage);
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
