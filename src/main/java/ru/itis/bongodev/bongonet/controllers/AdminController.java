package ru.itis.bongodev.bongonet.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.bongodev.bongonet.models.User;
import ru.itis.bongodev.bongonet.services.interfaces.UsersService;

@Controller
public class AdminController {

    @Autowired
    private UsersService usersService;

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/users")
    public String getUsersPage(Model model) {
        model.addAttribute("usersList", usersService.getAllUsers());
        return "admin_space/users_page";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/ban/{user-id}")
    public String banUser(@PathVariable("user-id") Long userId) {
        usersService.banUser(userId);
        return "redirect:/users";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/get/profile/{user-id}")
    public String getUserProfile(@PathVariable("user-id") Long userId, Model model) {
        User current = usersService.getUser(userId);
        model.addAttribute("user", current);
        model.addAttribute("profile", current.getProfile());
        return "admin_space/user_partial";
    }
}

