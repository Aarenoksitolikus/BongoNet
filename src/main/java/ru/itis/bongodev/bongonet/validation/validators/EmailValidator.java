package ru.itis.bongodev.bongonet.validation.validators;

import org.springframework.beans.factory.annotation.Autowired;
import ru.itis.bongodev.bongonet.services.interfaces.UsersService;
import ru.itis.bongodev.bongonet.validation.constraints.UniqueEmail;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class EmailValidator implements ConstraintValidator<UniqueEmail, String> {

    @Autowired
    private UsersService usersService;

    @Override
    public boolean isValid(String email, ConstraintValidatorContext constraintValidatorContext) {
        return usersService.getUserByEmail(email) == null;
    }
}
