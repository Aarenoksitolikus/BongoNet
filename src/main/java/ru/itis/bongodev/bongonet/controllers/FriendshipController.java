package ru.itis.bongodev.bongonet.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.bongodev.bongonet.models.FriendRequest;
import ru.itis.bongodev.bongonet.security.details.UserDetailsImpl;
import ru.itis.bongodev.bongonet.services.FriendsService;
import ru.itis.bongodev.bongonet.services.UsersService;

@Controller
public class FriendshipController {

    @Autowired
    private FriendsService friendsService;

    @Autowired
    private UsersService usersService;

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/add/friend/{user-id}")
    public String sendFriendRequest(@AuthenticationPrincipal UserDetailsImpl userDetails,
                                    @PathVariable("user-id") Long userId, FriendRequest request) {
        var recipient = usersService.getUser(userId);
        request.setSender(userDetails.getUser());
        request.setRecipient(recipient);
        friendsService.sendFriendRequest(request);
        return "redirect:/profile/" + recipient.getUsername();
    }

//    @PreAuthorize("isAuthenticated()")
//    public void addFriendRequests(@AuthenticationPrincipal UserDetailsImpl userDetails, Model model) {
//        model.addAttribute("sentRequests", friendsService.getAllFriendRequestsBySenderId(userDetails.getUser().getId()));
//    }
}
