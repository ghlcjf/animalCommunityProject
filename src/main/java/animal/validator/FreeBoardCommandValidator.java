package animal.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import animal.vo.FreeBoardCommand;

public class FreeBoardCommandValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return FreeBoardCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "boardTitle", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "boardContent", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "boardCategory", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required");
		
		
		
		
	}

}
