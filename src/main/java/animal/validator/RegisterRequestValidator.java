package animal.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import animal.vo.RegisterRequest;

public class RegisterRequestValidator implements Validator{

	//아이디 정규표현식 쓸까 말까? 
	//아이디 정규표현식: 영문, 숫자, 특수문자의 조합으로 6~20자리 사용하는것
	// private static final String IdExp = //정규표현식
	// "!/^[a-zA-Z0-9!@#$%^&*()?_~]{6,20}$/";
			
	private static final String emailExp =
			"^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
	
	private Pattern pattern = Pattern.compile(emailExp);		
	
	@Override //전달받은 객체가 커맨드객체가 맞는지 변환가능한지 체크
	public boolean supports(Class<?> clazz) {
		return RegisterRequest.class.isAssignableFrom(clazz);
	}
	
	
	@Override //검증-이름,아이디,비번,이메일,전번 입력했는지
	public void validate(Object target, Errors errors) {
		//이메일 형식맞는지 확인 , 아이디 형식맞는지 확인?
		//비밀번호 = 비밀번호 확인
		
		RegisterRequest regReq = (RegisterRequest)target;
		
		if(regReq.getId()==null || regReq.getId().trim().isEmpty()) {
			//아이디 입력했는지 확인
			errors.reject("id", "required");
		}
		
		
		
		
		//이메일 확인
		if(regReq.getEmail()==null || regReq.getEmail().trim().isEmpty()) {
			//이메일 입력됐는지 확인
			errors.reject("email", "required");
		}else {
			//이메일 형식이 맞는지
			Matcher matcher = pattern.matcher(regReq.getEmail());
			
			if(!matcher.matches()) {
				//정규식과 이메일 형식이일치하면 t, 아니면 f
				errors.rejectValue("email", "bad");
			}
		}
		
		//이름 확인
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required");
		//target객체에서 name필드getName()이 비어있거나 공백인경우
		//name 속성에 required값을 전달하는 에러메시지를 반환한다 
		
		//비밀번호 확인
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", "required");
		
		//아이디, 이메일, 전화번호 필수항목 확인
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "required");
		//비밀번호=확인 비밀번호 
		if(!regReq.isPasswordEqualToConfirmPassword()){
			errors.reject("confrimPassword", "nomatch");
		}
	
	
	}
	
	
	
	
	
}








