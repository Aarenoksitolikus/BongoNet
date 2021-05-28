package ru.itis.bongodev.bongonet.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ru.itis.bongodev.bongonet.models.Message;
import ru.itis.bongodev.bongonet.models.Notification;
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
        var user = usersService.getUser(userDetails.getUsername());
        model.addAttribute("user", user);
        var profile = user.getProfile();
        model.addAttribute("profile", profile != null ? profile : new Profile());
        model.addAttribute("chats", chatService.getAllChatsByUserId(user.getId()));
        return "chats_page";
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/messages/{sender-id}/{recipient-id}/count")
    public ResponseEntity<Long> countNewMessages(@PathVariable("sender-id") Long senderId,
                                                 @PathVariable("recipient-id") Long recipientId) {
        return ResponseEntity.ok(messageService.countNewMessages(senderId, recipientId));
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/messages/{sender-id}/{recipient-id}")
    public ResponseEntity<?> findMessages(@PathVariable("sender-id") Long senderId,
                                          @PathVariable("recipient-id") Long recipientId) {
        return ResponseEntity.ok(messageService.findMessages(senderId, recipientId));
    }

    @MessageMapping("/chat")
    public void processMessage(@Payload Message message) {
        var chat = chatService.getOrCreateChatByUsersIds(message.getSenderId(),
                message.getRecipientId(),
                true);
        message.setChat(chat);
        message = messageService.save(message);

        messagingTemplate.convertAndSendToUser(message.getRecipientId().toString(), "/queue/messages",
                Notification.builder()
                        .id(message.getId())
                        .senderId(message.getSenderId())
                        .senderUsername(message.getSenderUsername())
                        .build()
        );
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/get/chat/{sender-id}/{recipient-id}")
    public String getUserProfile(@AuthenticationPrincipal UserDetailsImpl userDetails,
                                 @PathVariable("sender-id") Long senderId,
                                 @PathVariable("recipient-id") Long recipientId,
                                 Model model) {
        var chat = messageService.findMessages(senderId, recipientId);
        var otherUserId = senderId.equals(userDetails.getUser().getId()) ? recipientId : senderId;
        model.addAttribute("currentUser", userDetails.getUser());
        model.addAttribute("otherUserId", otherUserId);
        model.addAttribute("otherUser", usersService.getUser(otherUserId));
        model.addAttribute("messages", chat);
        return "chat_partial";
    }
}
