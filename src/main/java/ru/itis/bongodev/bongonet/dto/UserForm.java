package ru.itis.bongodev.bongonet.dto;

import lombok.Data;
import ru.itis.bongodev.bongonet.validation.constraints.Password;
import ru.itis.bongodev.bongonet.validation.constraints.UniqueEmail;
import ru.itis.bongodev.bongonet.validation.constraints.Username;

import javax.validation.constraints.Email;

@Data
public class UserForm {
    @Username(message = "This username already taken")
    private String username;

    @Password(message = "Invalid password")
    private String password;

    @Email(message = "Incorrect email address")
    @UniqueEmail(message = "This email address is already in use")
    private String email;

    private String passwordCheck;
}
