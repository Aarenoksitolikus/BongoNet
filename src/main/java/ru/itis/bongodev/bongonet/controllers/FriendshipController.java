package ru.itis.bongodev.bongonet.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.bongodev.bongonet.models.Friendship;
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
                                    @PathVariable("user-id") Long userId, Friendship request) {
        var recipient = usersService.getUser(userId);
        request.setSender(userDetails.getUser());
        request.setRecipient(recipient);
        friendsService.sendFriendRequest(request);
        return "redirect:/profile/" + recipient.getUsername();
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/{action}/request/{request-id}")
    public String processFriendRequest(@AuthenticationPrincipal UserDetailsImpl userDetails, @PathVariable("request-id") Long requestId, @PathVariable String action) {
        Friendship friendship = friendsService.getFriendshipById(requestId);
        switch (action) {
            case "confirm":
                friendsService.confirmFriendRequest(friendship.getId());
                break;
            case "reject":
                friendsService.rejectFriendRequest(friendship.getId());
                break;
            case "cancel", "delete":
                friendsService.cancelFriendRequest(friendship.getId());
                break;
            default:
                break;
        }
        return "redirect:/profile/me";
    }
}
