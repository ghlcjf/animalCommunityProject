package animal.service;

import org.apache.ibatis.session.SqlSession;

import animal.dao.AnimalDao;
import animal.vo.User;

public class LoginCheckService {
	
	AnimalDao animalDao;
	
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}

	public User userLogin(User user) {
		return animalDao.selectById(SqlSession, user);
	}
	
}
