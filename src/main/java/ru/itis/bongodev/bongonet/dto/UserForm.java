package ru.itis.bongodev.bongonet.dto;

import lombok.Data;
import ru.itis.bongodev.bongonet.validation.constraints.Password;
import ru.itis.bongodev.bongonet.validation.constraints.Username;

import javax.validation.constraints.Email;

@Data
public class UserForm {
    //    @Username(message = "{errors.invalid.username}")
    @Username(message = "This username already taken")
    private String username;

//    @Password(message = "{errors.invalid.password}")
    @Password(message = "Invalid password")
    private String password;

//    @Email(message = "{errors.incorrect.email}")
    @Email(message = "Incorrect email address")
    private String email;

    private String passwordCheck;
}
