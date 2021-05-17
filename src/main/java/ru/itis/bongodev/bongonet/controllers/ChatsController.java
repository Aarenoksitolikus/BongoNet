package ru.itis.bongodev.bongonet.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.bongodev.bongonet.models.Message;
import ru.itis.bongodev.bongonet.models.Profile;
import ru.itis.bongodev.bongonet.models.User;
import ru.itis.bongodev.bongonet.security.details.UserDetailsImpl;
import ru.itis.bongodev.bongonet.services.interfaces.ChatService;
import ru.itis.bongodev.bongonet.services.interfaces.MessageService;
import ru.itis.bongodev.bongonet.services.interfaces.UsersService;

@Controller
public class ChatsController {
    @Autowired
    private UsersService usersService;

    @Autowired
    private SimpMessagingTemplate messagingTemplate;
    @Autowired
    private MessageService messageService;
    @Autowired
    private ChatService chatService;

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/chats")
    public String getChatsPage(@AuthenticationPrincipal UserDetailsImpl userDetails, Model model) {
        User user = usersService.getUser(userDetails.getUsername());
        model.addAttribute("user", user);
        var profile = user.getProfile();
        model.addAttribute("profile", profile != null ? profile : new Profile());
        return "ololo";
    }

    @MessageMapping("/chat")
    public void processMessage(@Payload Message message) {
        var chatId = 1;
    }
}
