package animal.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import animal.vo.IssueBoardCommand;

public class IssueBoardCommandValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		return IssueBoardCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "issueTitle", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "issueContent", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required");
		
	}

}
