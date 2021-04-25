package ru.itis.bongodev.bongonet.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.bongodev.bongonet.models.Profile;
import ru.itis.bongodev.bongonet.models.User;
import ru.itis.bongodev.bongonet.security.details.UserDetailsImpl;
import ru.itis.bongodev.bongonet.services.UsersService;

@Controller
public class ChatsController {
    @Autowired
    private UsersService usersService;

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/chats")
    public String getChatsPage(@AuthenticationPrincipal UserDetailsImpl userDetails, Model model) {
        User user = usersService.getUser(userDetails.getUsername());
        model.addAttribute("user", user);
        var profile = user.getProfile();
        model.addAttribute("profile", profile != null ? profile : new Profile());
        return "ololo";
    }
}
