package ru.itis.bongodev.bongonet.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.bongodev.bongonet.dto.UserForm;
import ru.itis.bongodev.bongonet.services.SignUpService;

import javax.annotation.security.PermitAll;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Objects;
import java.util.stream.Collectors;

@Controller
public class SignUpController {

    @Autowired
    private SignUpService signUpService;

    @PermitAll
    @GetMapping("/signup")
    public String getSignUpPage(Model model) {
        model.addAttribute("userForm", new UserForm());
        return "sign_up_page";
    }

    @PermitAll
    @PostMapping("/signup")
    public String signUp(@Valid UserForm form, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("userForm", form);
            return "sign_up_page";
        }
        signUpService.signUp(form);
        return "redirect:/auth";
    }

    @PermitAll
    @GetMapping("/confirm/{user-confirm-code}")
    public String getConfirmPage(@PathVariable("user-confirm-code") String code) {
        return signUpService.confirm(code) ? "success_confirm_page" : "error_page";
    }
}
