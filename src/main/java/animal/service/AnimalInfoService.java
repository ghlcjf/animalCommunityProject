package animal.service;

import java.util.List;

import animal.dao.AnimalDao;
import animal.vo.AnimalInfo;
import animal.vo.AnimalInfoCommand;
import animal.vo.SectionPage;

public class AnimalInfoService {
	
	
	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	public List<AnimalInfo> selectAllAnimalInfoList(){
		
		List<AnimalInfo> animalInfoList = animalDao.selectAllAniaml();
		
		return animalInfoList;
	}
	
	
	public void insertAnimalInfo(AnimalInfoCommand animalInfoCommand) {
		
		
		animalDao.insertAnimalInfo(animalInfoCommand);
		
	}


	public AnimalInfo selectAnimalInfoByBoardNum(long boardNum) {
		
		return animalDao.selectByNum(boardNum);
	}


	public void updateAnimalInfo(AnimalInfoCommand animalInfoCommand) {
		animalDao.updateAnimalInfo(animalInfoCommand);
	}


	public void deleteAnimalInfoByBoardNum(long animalNum) {
		animalDao.deleteAnimalInfoByBoardNum(animalNum);
	}


	public List<AnimalInfo> selectTargetAnimalInfoList(SectionPage sectionPage) {
		
		return animalDao.selectTargetAnimalInfoList(sectionPage);
	}


	public int selectAllNumAnimalInfo() {
		
		return animalDao.selectAllNumAnimalInfo();
	}

}
