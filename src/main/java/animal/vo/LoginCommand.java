package animal.vo;

public class LoginCommand {
	//클라이언트의 데이터를 묶어서 서버로(컨트롤러로) 보내준다 
	private String id;
	private String password;
	private String email;
	private boolean rememberId;  //쿠키로 사용될것
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isRememberId() {
		return rememberId;
	}
	public void setRememberId(boolean rememberId) {
		this.rememberId = rememberId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}




