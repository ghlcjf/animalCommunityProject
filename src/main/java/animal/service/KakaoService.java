package animal.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import com.fasterxml.jackson.core.JsonParser;

public class KakaoService {
	
	
	public String getAccessToken (String authorizeCode) {
		String accessToken = "";
		String refreshToken = "";
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
			sb.append("grant_type = authorization_code");
			sb.append("&client_id=3e99b1f9d093993529dc3f7a28116951");
			sb.append("&redirect_uri=http://localhost:8090/animalCommunity/kakaoLogin"); 
	        sb.append("&code=" + authorizeCode);
	        bw.write(sb.toString());
	        bw.flush();
            
	        int responseCode = conn.getResponseCode(); // 결과 200이면 성공
            System.out.println("responseCode : " + responseCode);
            
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            
            System.out.println("response body : " + result);
			
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
            
            
            
            
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return accessToken;
		
	}

}
