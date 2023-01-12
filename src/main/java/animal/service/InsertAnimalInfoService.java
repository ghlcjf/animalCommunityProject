package animal.service;

import animal.dao.AnimalDao;
import animal.vo.AnimalInfoCommand;

public class InsertAnimalInfoService {
	
	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}

	public void insertAnimalInfo(AnimalInfoCommand animalInfoCommand) {
		
		
		animalDao.insertAnimalInfo(animalInfoCommand);
		
	}
	
	
	

}
