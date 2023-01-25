package animal.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import animal.dao.AnimalDao;
import animal.vo.HospitalInfo;

@RestController
public class HospitalGBController {
	// 추천, 반대 수를 올리는 레스트 컨트롤러

	private AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	@RequestMapping("/hospitalGood/{boardNum}")
	public int good(@PathVariable("boardNum") long boardNum) {
		
		HospitalInfo updateHospitalInfo = animalDao.selectByHospitalNum(boardNum);
		animalDao.addGoodCount(updateHospitalInfo);
		HospitalInfo hospitalInfo = animalDao.selectByHospitalNum(boardNum);
		
		int num = hospitalInfo.getGood();
		
		return num;
	}
	
	@RequestMapping("/hospitalBad/{boardNum}")
	public int bad(@PathVariable("boardNum") long boardNum) {
		
		HospitalInfo updaHospitalInfo = animalDao.selectByHospitalNum(boardNum);
		animalDao.addBadCount(updaHospitalInfo);
		HospitalInfo hospitalInfo = animalDao.selectByHospitalNum(boardNum);
		
		int num = hospitalInfo.getBad();
		
		return num;
	}
}
