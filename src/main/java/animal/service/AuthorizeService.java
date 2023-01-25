package animal.service;

import animal.dao.AnimalDao;

public class AuthorizeService {
	
	private AnimalDao animalDao;

	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}

	public void authorize(String id) {
		animalDao.authorize(id);
	}
	
	
}
