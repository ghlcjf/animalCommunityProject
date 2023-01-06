package animal.vo;

public class LoginUserInfo {
	//로그인한 회원의 정보를 기록한다 
	private String id;
	private String email;
	private String name;
	
	public LoginUserInfo(String id, String email, String name) {
		this.id = id;
		this.email = email;
		this.name = name;
	}

	public LoginUserInfo() {} //클래스 빌더 스타일 

	public LoginUserInfo setName(String name) {
		this.name = name;
		return this;
	}
	public LoginUserInfo setId(String id) {
		this.id = id;
		return this;
	}
	public LoginUserInfo setEmail(String email) {
		this.email = email;
		return this;
	}

	public String getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public String getName() {
		return name;
	}

	
	
}
