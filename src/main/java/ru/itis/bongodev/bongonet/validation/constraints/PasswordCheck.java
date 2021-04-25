package ru.itis.bongodev.bongonet.validation.constraints;

import ru.itis.bongodev.bongonet.validation.validators.PasswordCheckValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = PasswordCheckValidator.class)
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface PasswordCheck {

    String message() default "Passwords mismatch";

    String password();

    String passwordCheck();

    @Target({ElementType.TYPE})
    @Retention(RetentionPolicy.RUNTIME)
    @interface List {
        PasswordCheck[] value();
    }

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
