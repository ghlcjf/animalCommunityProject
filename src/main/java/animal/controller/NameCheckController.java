package animal.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import animal.dao.AnimalDao;
import animal.service.NameCheckService;

@RestController
public class NameCheckController {

	private NameCheckService nameCheckService;

	public void setNameCheckService(NameCheckService nameCheckService) {
		this.nameCheckService = nameCheckService;
	}




	@RequestMapping("/nameCheck")
	public String nameCheck(@RequestParam("name") String name) {
		
		String nickName = nameCheckService.nameCheck(name);
		
		if(nickName==null) {
			return "사용가능한 닉네임 입니다.";
		}
		
		return "중복된 닉네임 입니다.";
	}
}
