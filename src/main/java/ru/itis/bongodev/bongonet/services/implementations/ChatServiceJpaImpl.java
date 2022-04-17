package ru.itis.bongodev.bongonet.services.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import ru.itis.bongodev.bongonet.models.Chat;
import ru.itis.bongodev.bongonet.models.User;
import ru.itis.bongodev.bongonet.repositories.ChatRepository;
import ru.itis.bongodev.bongonet.repositories.UsersRepository;
import ru.itis.bongodev.bongonet.services.interfaces.ChatService;

import java.util.List;

@Service
public class ChatServiceJpaImpl implements ChatService {

    @Autowired
    private ChatRepository chatRepository;

    @Autowired
    private UsersRepository usersRepository;

    @Override
    public Chat getOrCreateChatByUsersIds(Long senderId, Long recipientId, boolean createIfNotExist) {
        Chat chat = chatRepository.findBySenderIdAndRecipientId(senderId, recipientId).orElse(null);
        if (chat == null) {
            if (createIfNotExist) {
                var sender = usersRepository.findById(senderId).get();
                var recipient = usersRepository.findById(recipientId).get();
                chat = Chat.builder()
                        .senderId(senderId)
                        .recipientId(recipientId)
                        .senderUsername(sender.getUsername())
                        .senderAvatar(sender.getAvatar())
                        .recipientUsername(recipient.getUsername())
                        .recipientAvatar(recipient.getAvatar())
                        .build();
                return chatRepository.save(chat);
            }
        }
        return chat;
    }

    @Override
    public List<Chat> getAllChatsByUserId(Long userId) {
        return chatRepository.findAllByUserId(userId);
    }
}
