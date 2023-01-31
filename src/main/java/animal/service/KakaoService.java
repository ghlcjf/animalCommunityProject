package animal.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import animal.dao.AnimalDao;
import animal.vo.RegisterRequest;
import animal.vo.User;


public class KakaoService {
	private AnimalDao animalDao;
	public void setAnimalDao(AnimalDao animalDao) {
		this.animalDao = animalDao;
	}



	public String getAccessToken (String authorize_Code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			// 포스트 요청을 위해 기본값 true 설정
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			
			// 포스트 요청에 필요로 요구하는 파라미터 > 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=3e99b1f9d093993529dc3f7a28116951");
			sb.append("&redirect_uri=http://localhost:8090/animalCommunity/kakaoLogin"); 
	        sb.append("&code=" + authorize_Code);
	        bw.write(sb.toString());
	        bw.flush();
            
	        int responseCode = conn.getResponseCode(); // 결과 200이면 성공
            
            
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            
			
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            br.close();
            bw.close();
            
            
            
            
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return access_Token;
		
	}
	
	
	
	public HashMap<String,Object> getUserInfo (String access_Token) {
		
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있음 => HashMap
		HashMap<String,Object> userInfo = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			
			// Header에 들어갈 내용
			conn.setRequestProperty("Authorization", "Bearer "+access_Token);
			
			int responseCode = conn.getResponseCode();
			
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			
			String line = "";
			String result = "";
			
			
			while((line=br.readLine())!=null) {
				result +=line;
			}
			
			
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			
			
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return userInfo;
	}
	
	
	public User selectUserInfoByKakaoEmail(String email) {
		User user = animalDao.selectUserInfoByKakaoEmail(email);
		return user;
	}




	public void insertKakaoUser(RegisterRequest regreq) {
		animalDao.insertKakaoUser(regreq);
		
	}



	public User selectUserInfoByKakaonickname(String nickname) {
		
		return animalDao.selectUserInfoByKakaonickname(nickname);
	}



	public int getUserNum() {
		
		return animalDao.getUserNum(); 

	}
	
	

}
