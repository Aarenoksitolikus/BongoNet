package ru.itis.bongodev.bongonet.services.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.bongodev.bongonet.models.Chat;
import ru.itis.bongodev.bongonet.repositories.ChatRepository;
import ru.itis.bongodev.bongonet.services.interfaces.ChatService;

@Service
public class ChatServiceJpaImpl implements ChatService {

    @Autowired
    private ChatRepository chatRepository;

    @Override
    public Chat getOrCreateChatByUsersIds(String senderId, String recipientId, boolean createIfNotExist) {
        Chat chat = chatRepository.findBySenderIdAndRecipientId(senderId, recipientId).orElse(null);
        if (chat == null) {
            if (createIfNotExist) {
                chat = Chat.builder()
                        .senderId(senderId)
                        .recipientId(recipientId)
                        .build();
                return chatRepository.save(chat);
            }
        }
        return chat;
    }
}
