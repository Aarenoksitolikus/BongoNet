package ru.itis.bongodev.bongonet.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.bongodev.bongonet.models.Profile;
import ru.itis.bongodev.bongonet.models.User;
import ru.itis.bongodev.bongonet.security.details.UserDetailsImpl;
import ru.itis.bongodev.bongonet.services.UsersService;

@Controller
public class ProfileController {

    @Autowired
    private UsersService usersService;

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/profile")
    public String getProfilePage(@AuthenticationPrincipal UserDetailsImpl userDetails, Model model) {
        User user = usersService.getUser(userDetails.getUsername());
        model.addAttribute("user", user);
        model.addAttribute("profile", user.getProfile());
        if (user.getRole() == User.Role.ADMIN) {
            return "admin_space/admin_page";
        }
        return "profile_page";
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/profile/settings")
    public String getSettingsPage(Profile profile, Model model) {
        model.addAttribute(profile);
        return "settings_page";
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/profile/settings")
    public String changeProfile(Profile profile) {
        usersService.updateProfile(profile);
        return "redirect:/profile";
    }
}
