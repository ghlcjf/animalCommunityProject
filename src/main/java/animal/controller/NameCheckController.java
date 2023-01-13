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


	@RequestMapping(value="/nameCheck",produces = "application/text; charset=UTF-8")
	public String nameCheck(@RequestParam("name") String name) {
		
		String nickName = nameCheckService.nameCheck(name);

		if(nickName==null) {
			return "사용가능한 닉네임 입니다.";
		}
		
		return "이미 사용중인 닉네임 입니다.";
	}
	
	@RequestMapping(value="/idCheck",produces = "application/text; charset=UTF-8")
	public String idCheck(@RequestParam("id") String id) {
		
		System.out.println(id);
		String newId = nameCheckService.idCheck(id);

		if(newId==null) {
			return "사용가능한 아이디 입니다.";
		}
		
		return "이미 사용중인 아이디 입니다.";
	}
}
