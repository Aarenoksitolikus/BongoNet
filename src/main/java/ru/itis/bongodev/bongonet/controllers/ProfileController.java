package ru.itis.bongodev.bongonet.controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.bongodev.bongonet.models.User;
import ru.itis.bongodev.bongonet.security.details.UserDetailsImpl;

@Controller
public class ProfileController {

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/profile")
    public String getProfilePage(@AuthenticationPrincipal UserDetailsImpl user, Model model) {
        model.addAttribute("user", user);
        if (user.getRole() == User.Role.ADMIN) {
            return "admin_space/admin_page";
        }
        return "profile_page";
    }
}
