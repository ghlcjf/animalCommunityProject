package animal.controller;

import java.util.regex.Pattern;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import animal.service.NameCheckService;

@RestController
public class NameCheckController {

	private NameCheckService nameCheckService;

	public void setNameCheckService(NameCheckService nameCheckService) {
		this.nameCheckService = nameCheckService;
	}


	@RequestMapping(value="/myPage/nameCheck",produces = "application/text; charset=UTF-8")
	public String myPageNameCheck(@RequestParam("name") String name) {
		
		String nameRegex = "^[가-힣]{1}[a-z0-9가-힣]{1,7}$";
		if(!Pattern.matches(nameRegex, name)) {
			
			return "적합하지 않은 닉네임 형식";
		}
			
		String nickName = nameCheckService.nameCheck(name);

		if(nickName==null) {
			return "사용가능한 닉네임 입니다.";
		}
		
		return "이미 사용중인 닉네임 입니다.";
		
	}
	
	@RequestMapping(value="/nameCheck",produces = "application/text; charset=UTF-8")
	public String nameCheck(@RequestParam("name") String name) {
		
		String nameRegex = "^[가-힣]{1}[a-z0-9가-힣]{1,7}$";
		if(!Pattern.matches(nameRegex, name)) {
			
			return "적합하지 않은 닉네임 형식";
		}
			
		String nickName = nameCheckService.nameCheck(name);

		if(nickName==null) {
			return "사용가능한 닉네임 입니다.";
		}
		
		return "이미 사용중인 닉네임 입니다.";
		
	}
	
	@RequestMapping(value="/idCheck",produces = "application/text; charset=UTF-8")
	public String idCheck(@RequestParam("id") String id) {
		
		String idRegex = "^[a-z]{1}[a-z0-9]{5,15}$";
		System.out.println(Pattern.matches(idRegex, id));
		if(!Pattern.matches(idRegex, id)) {
			
			return "적합하지 않은 아이디 형식";
		}
		
		String newId = nameCheckService.idCheck(id);

		if(newId==null) {
			return "사용가능한 아이디 입니다.";
		}
		
		return "이미 사용중인 아이디 입니다.";
	}
}
