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
		System.out.println("#########" + code);
		String access_Token = kakaoService.getAccessToken(code);
		HashMap<String,Object> userInfo = kakaoService.getUserInfo(access_Token);
		
		System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###userInfo#### : " + userInfo.get("email"));
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
        
		
		String email = (String) userInfo.get("email");
		if(email==null){
			kakaoService.unlink(access_Token);
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
		session.setAttribute("access_Token", access_Token);
		session.setAttribute("userInfo", loginUserinfo);
		
		return "redirect:/main";
		
		
		
	}
	
	
	
	
	
}
