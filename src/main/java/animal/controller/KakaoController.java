package animal.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import animal.service.KakaoService;
import animal.vo.LoginUserInfo;
import animal.vo.RegisterRequest;
import animal.vo.User;

@Controller
public class KakaoController {
	
	private KakaoService kakaoService;

	public void setKakaoService(KakaoService kakaoService) {
		this.kakaoService = kakaoService;
	}

	
	
	@RequestMapping("/kakaoLogin")
	public String kakaoLoginForm(@RequestParam(value="code", required=false) String code,
			HttpSession session)
		throws Exception {
		String access_Token = kakaoService.getAccessToken(code);
		HashMap<String,Object> userInfo = kakaoService.getUserInfo(access_Token);
		String email = (String) userInfo.get("email");
		if(email==null){
			return "login/kakaoLoginForm";
		}
		String nickname = (String) userInfo.get("nickname");
		User user = null; 
		user = kakaoService.selectUserInfoByKakaoEmail(email);
		
		if(user==null) {
			RegisterRequest regreq = new RegisterRequest();
			User nicknameUser = kakaoService.selectUserInfoByKakaonickname(nickname);
			if(nicknameUser!=null) {
				int cnt = kakaoService.getUserNum();
				regreq.setName(nickname+"kakao"+cnt);
			}else {
				regreq.setName(nickname);
			}
			
			regreq.setAdmin(0);
			regreq.setEmail(email);
			
			
			kakaoService.insertKakaoUser(regreq);
			user = kakaoService.selectUserInfoByKakaoEmail(email);
		}
		
		LoginUserInfo loginUserinfo = new LoginUserInfo()
										.setAdmin(user.getAdmin())
										.setEmail(user.getEmail())
										.setName(user.getName());
		
		session.setAttribute("userInfo", loginUserinfo);
		
		return "redirect:/main";
		
		
		
	}
	
	
	
	
	
}
