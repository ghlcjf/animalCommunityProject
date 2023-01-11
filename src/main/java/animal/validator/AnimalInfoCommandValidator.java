package animal.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import animal.vo.AnimalInfoCommand;

public class AnimalInfoCommandValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		
		return AnimalInfoCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "animalTitle", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "animalContent", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "animalCategory", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "animalUrl", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required");
		
	}

}
