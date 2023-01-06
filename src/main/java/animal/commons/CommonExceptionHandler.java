package animal.commons;

import org.springframework.beans.TypeMismatchException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import animal.exception.MemberNotFoundException;

@ControllerAdvice("spring")
public class CommonExceptionHandler {
	
	// 1. id에 숫자가 아닌 값을 받는 경우 에러 처리
	@ExceptionHandler(TypeMismatchException.class)
	public String handlerTypeMiamatchException(TypeMismatchException e){
		e.printStackTrace();
		return "error/invalidate";  //에러페이지
	}
	
	
	
	// 3. 일반적인 실행 예외 처리
	@ExceptionHandler(RuntimeException.class)
	public String handlerRuntimeException(Exception e) {
		e.printStackTrace();
		return "error/commonException";
	}
	
//id에러
	//1.존재하지 않는 id일때 
	@ExceptionHandler(MemberNotFoundException.class)
	public String handlerMemberNotFoundException(MemberNotFoundException e) {
		e.printStackTrace();
		return "member/noMember"; //에러페이지로
	}
	
	
	
	
	
	
	
}
