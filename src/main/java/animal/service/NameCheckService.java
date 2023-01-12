package animal.service;

import org.springframework.beans.factory.annotation.Autowired;

import animal.dao.AnimalDao;

public class NameCheckService {
	
	private AnimalDao animalDao;
	@Autowired
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	public String nameCheck(String name) {
		String nickName = animalDao.nameCheck(name);
		
		return nickName;
	}
	
}
