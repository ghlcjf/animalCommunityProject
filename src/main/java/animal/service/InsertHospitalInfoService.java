package animal.service;

import animal.dao.AnimalDao;
import animal.vo.HospitalInfoCommand;

public class InsertHospitalInfoService {
	
	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	
	public void insertHospitalInfo(HospitalInfoCommand hospitalInfoCommand) {
		
		animalDao.insertHospitalInfo(hospitalInfoCommand);
		
		
	}

}
