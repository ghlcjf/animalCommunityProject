package animal.service;

import animal.dao.AnimalDao;
import animal.exception.AlreadyExistingMemberException;
import animal.vo.RegisterRequest;
import animal.vo.User;

public class MemberRegisterService {
	//회원정보 저장
	
	private AnimalDao dao; //사용할 객체를 직접 생성한다
	
	public MemberRegisterService(AnimalDao dao) {
		//객체를 외부에서 의존주입받는다
		this.dao = dao;
	}
	
	public void regist(RegisterRequest req) {
		User user = dao.selectById(req.getId());
		if(user != null) {
			throw new AlreadyExistingMemberException("계정중복: "+req.getId());
		}
		User newUser = new User(req.getId(),
						   req.getPassword(),
						   req.getName(),
						   req.getEmail(),
						   req.getPhone(),
						   req.getAdmin()
						   );
						   
		dao.insertUser(newUser);
		
	}
	
	
	
}



