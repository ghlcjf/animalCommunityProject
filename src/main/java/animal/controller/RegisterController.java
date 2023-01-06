package animal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import animal.exception.AlreadyExistingMemberException;
import animal.service.MemberRegisterService;
import animal.validator.RegisterRequestValidator;
import animal.vo.RegisterRequest;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	private MemberRegisterService memberRegisterService;

	public void setMemberRegisterService(MemberRegisterService memberRegisterService) {
		this.memberRegisterService = memberRegisterService;
	}
	
	@GetMapping("/step1") //만들어진 커맨드 객체를 jsp에 넘길때 사용하는 이름 view/register/step1
	public String handlerStep1() {
		return "register/step1"; //WEB-INF/views/step1 + .jsp로 이동
	}
	
	@GetMapping("/step2")
	public String handlerStep2Get(){	
		return "redirect:step1"; // step1 요청으로 리다이렉트
		// register/step1 매핑 컨트롤러로 연결
	}	
	@GetMapping("/step3")
	public String handlerStep3Get() {
		return "redirect:register/step1";
	}
	
	@PostMapping("/step2")
	public String handlerStep2(@RequestParam(value="agree", defaultValue="false")boolean agree, Model model) {
		//전달받은 데이터 읽어오기
		if(!agree) {
			return "register/step1";
		}
		//비어있는 formData 넘겨주기 -> 스프링 커스텀 폼태그에 에러가 안나게됨
		model.addAttribute("formData", new RegisterRequest());
		
		return "register/step2";
	}
	
	@PostMapping("/step3")
	public String handlerStep3(@ModelAttribute("formData")RegisterRequest regReq, Errors errors) {
		//전달받은 데이터 읽어오기(객체에 파라미터와 이름이 같은 set메서드가 반드시 존재해야함)
		
		//RegisterRequest 객체 검증
		new RegisterRequestValidator().validate(regReq, errors);
		
		if(errors.hasErrors()) {
			//에러 객체에 에러가 하나라도 검출이 되었다면
			return "register/step2";
		}
		
		//받아온 데이터 -> DB
		try {
			memberRegisterService.regist(regReq);
			return "register/step3";
		}catch(AlreadyExistingMemberException e) {//아이디 중복되는 경우 
			errors.rejectValue("id", "duplicate");
			return "register/step2";
		}
		
		
		
	}
	
	
	
}





