package ru.itis.bongodev.bongonet.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.security.PermitAll;

@Controller
public class SignInController {
    @PermitAll
    @GetMapping("/auth")
    public String getSignInPage() {
        return "sign_in_page";
    }
}

