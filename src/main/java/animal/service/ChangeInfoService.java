package animal.service;

import animal.dao.AnimalDao;
import animal.vo.User;

public class ChangeInfoService {

	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}

	public void changeInfo(User user) {
		
		
		animalDao.changeInfo(user);
	}
	
	

}
