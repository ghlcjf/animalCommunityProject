package animal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import animal.service.KakaoService;

@Controller
public class KakaoController {
	
	private KakaoService kakaoService;

	public void setKakaoService(KakaoService kakaoService) {
		this.kakaoService = kakaoService;
	}

	
	@RequestMapping("/kakaoLogin")
	public String kakaoLoginForm(@RequestParam(value="code", required=false) String code)
		throws Exception {
		System.out.println("########:"+code);
		String accessToken = kakaoService.getAccessToken(code);
		System.out.println("##accessToken###:"+accessToken);
		return "login/kakaoLogin";
		
	}
	
	
	
	
	
}
