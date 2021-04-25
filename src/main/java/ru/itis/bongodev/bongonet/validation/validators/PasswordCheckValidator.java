package ru.itis.bongodev.bongonet.validation.validators;

import org.springframework.beans.BeanWrapperImpl;
import ru.itis.bongodev.bongonet.validation.constraints.PasswordCheck;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PasswordCheckValidator implements ConstraintValidator<PasswordCheck, Object> {
    private String passwordPropertyName;
    private String passwordCheckPropertyName;

    @Override
    public void initialize(PasswordCheck constraintAnnotation) {
        this.passwordPropertyName = constraintAnnotation.password();
        this.passwordCheckPropertyName = constraintAnnotation.passwordCheck();
    }

    @Override
    public boolean isValid(Object value, ConstraintValidatorContext context) {
        Object password = new BeanWrapperImpl(value).getPropertyValue(passwordPropertyName);
        Object passwordCheck = new BeanWrapperImpl(value).getPropertyValue(passwordCheckPropertyName);

        return password != null && password.equals(passwordCheck);
    }
}
