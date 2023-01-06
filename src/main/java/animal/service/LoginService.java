package animal.service;

import org.springframework.beans.factory.annotation.Autowired;

import animal.dao.AnimalDao;
import animal.exception.IdPasswordNotMatchingException;
import animal.vo.LoginCommand;
import animal.vo.User;
import animal.vo.LoginUserInfo;

public class LoginService {
	//로그인 기능 담당 객체
	
	private AnimalDao animalDao;
	@Autowired
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}
	
	public LoginUserInfo checkLogin(LoginCommand lc) {
		User user = animalDao.selectById(lc.getId());
		
		if(user == null) {
			throw new IdPasswordNotMatchingException();
		}
		if(!user.getPassword().equals(lc.getPassword())) {
			throw new IdPasswordNotMatchingException();
		}//비밀번호 틀렸을때
		
		//로그인 성공했을때
		LoginUserInfo userInfo = new LoginUserInfo()
							.setEmail(user.getEmail())
							.setId(user.getId())
							.setName(user.getName());
		return userInfo;
	}

	
	
	
}
