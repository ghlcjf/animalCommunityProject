package animal.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import animal.exception.IdPasswordNotMatchingException;
import animal.service.LoginService;
import animal.validator.LoginCommandValidator;
import animal.vo.LoginCommand;
import animal.vo.LoginUserInfo;
import animal.vo.RegisterRequest;

@Controller
public class LoginController {

	private LoginService loginService;

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
	
	@GetMapping("/login")
	public String form(LoginCommand loginCommand,
		@CookieValue(value="rememberId", required=false)Cookie rememberId){
			
		if(rememberId !=null) {
			loginCommand.setId(rememberId.getValue());
			loginCommand.setRememberId(true);
		}
		return "login/loginForm";
	}
	
	@PostMapping("/login")
	public String submit(LoginCommand loginCommand,Errors errors, HttpSession session, HttpServletResponse response) {
		//1.아이디와 비번이 일치하는지 확인
		new LoginCommandValidator().validate(loginCommand,errors);
		
		if(errors.hasErrors()) {
			return "login/loginForm";
		}
		
		//2.입력받은 아이디와 비번으로 로그인
		try {
			LoginUserInfo loginUserInfo = loginService.checkLogin(loginCommand);
		
			//로그인 후 로그아웃할때가지 회원 정보를 유지
			session.setAttribute("userInfo", loginUserInfo);
			
			//아이디 저장용 쿠키 만들기
			Cookie rememberIdCookie = new Cookie("rememberId",loginCommand.getId());
		
			if(loginCommand.isRememberId()) {
				  //아이디를 저장하겠다
				rememberIdCookie.setMaxAge(365*24*60*60); //쿠키를 1년동안 저장
				
			}else {//아이디를 저장하지 않겠다
				rememberIdCookie.setMaxAge(0); //쿠키 저장안하고 그냥 삭제
			}
			
			response.addCookie(rememberIdCookie);
			return "login/loginSuccess";
		
		}catch(IdPasswordNotMatchingException e) {
			errors.reject("idPasswordNotMatching");
			//글로벌 에러
			return "login/loginForm";
		}

		
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
	





