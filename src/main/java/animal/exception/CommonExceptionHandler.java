package animal.exception;



import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class CommonExceptionHandler {

	
//	 @ExceptionHandler(Exception.class) 
//	 public String handlerException(Exception e) {
//	  
//	 return "error/commonException"; 
//	 }
//	  
//	  
//	 @ExceptionHandler(RuntimeException.class) 
//	 public String runTimeError(RuntimeException e) { return "error/commonException"; }
//	 
//	 @ExceptionHandler(NoHandlerFoundException.class)
//	 
//	 @ResponseStatus(HttpStatus.NOT_FOUND) public String
//	 noException(NoHandlerFoundException e) { return "error/commonException"; }
//	 

}
