package animal.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import animal.vo.FreeCommentCommand;

public class FreeCommentCommandValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		
		return FreeCommentCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "commentContent", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "boardNum", "required");
		
	}

}
