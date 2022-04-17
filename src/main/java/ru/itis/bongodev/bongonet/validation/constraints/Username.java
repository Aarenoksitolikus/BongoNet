package ru.itis.bongodev.bongonet.validation.constraints;

import ru.itis.bongodev.bongonet.validation.validators.UsernameValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = UsernameValidator.class)
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Username {
    String message() default "This username already exists";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
