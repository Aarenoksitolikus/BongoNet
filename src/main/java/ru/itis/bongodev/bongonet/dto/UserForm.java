package ru.itis.bongodev.bongonet.dto;

import lombok.Data;
import ru.itis.bongodev.bongonet.validation.constraints.Password;
import ru.itis.bongodev.bongonet.validation.constraints.Username;

import javax.validation.constraints.Email;

@Data
public class UserForm {
    @Username(message = "This username already taken ")
    private String username;
//    @Password
    private String password;
    @Email(message = "Incorrect email address")
    private String email;
}
