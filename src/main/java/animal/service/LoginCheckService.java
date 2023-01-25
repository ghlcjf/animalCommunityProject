package animal.service;

import animal.dao.AnimalDao;
import animal.vo.User;

public class LoginCheckService {
	
	AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}

	
	public boolean loginCheck(User user) {
		String id = user.getId();
		
		User checkUser = animalDao.selectById(id);
		
		if (checkUser!=null) {
			if (checkUser.getPassword().equals(user.getPassword())) {
				return true;
			}
		}
		return false;
	}
	
}
