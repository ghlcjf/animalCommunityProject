package animal.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import animal.vo.HospitalInfoCommand;

public class HospitalInfoCommandValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		return HospitalInfoCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "hospitalName", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "hospitalLoc", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "hospitalTel", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "detailedAddress", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "hospitalInfo", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required");
		
	}

}
