package ru.itis.bongodev.bongonet.validation.validators;

import org.springframework.beans.factory.annotation.Autowired;
import ru.itis.bongodev.bongonet.services.UsersService;
import ru.itis.bongodev.bongonet.validation.constraints.Username;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UsernameValidator implements ConstraintValidator<Username, String> {

    @Autowired
    private UsersService usersService;

    @Override
    public boolean isValid(String username, ConstraintValidatorContext constraintValidatorContext) {
        return usersService.getUser(username) == null;
    }
}
