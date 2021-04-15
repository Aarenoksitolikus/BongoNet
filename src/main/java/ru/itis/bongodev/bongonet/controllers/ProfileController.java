package ru.itis.bongodev.bongonet.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.bongodev.bongonet.dto.ProfileForm;
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
        var user = getUser(userDetails, model);
        var profile = user.getProfile();
        model.addAttribute("profile", profile != null ? profile : new Profile());
        if (user.getRole() == User.Role.ADMIN) {
            return "admin_space/admin_page";
        }
        return "profile_page";
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/profile/settings")
    public String getSettingsPage(@AuthenticationPrincipal UserDetailsImpl userDetails, Model model) {
        var user = getUser(userDetails, model);
        if (user != null) {
            Profile profile = user.getProfile();
            model.addAttribute("profile", profile);
        }
        return "settings_page";
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/profile/settings")
    public String changeProfile(@AuthenticationPrincipal UserDetailsImpl userDetails, ProfileForm form) {
        form.setId(userDetails.getId());
        System.out.println(form);
        usersService.updateProfile(form);
        return "redirect:/profile";
    }

    private User getUser(UserDetailsImpl userDetails, Model model) {
        User result = usersService.getUser(userDetails.getUsername());
        model.addAttribute("user", result);
        return result;
    }
}
