package ru.itis.bongodev.bongonet.dto;

import lombok.Data;

import javax.validation.constraints.Email;

@Data
public class UserForm {
    private String username;
    private String password;

    @Email(message = "{Incorrect email address}")
    private String email;
}
