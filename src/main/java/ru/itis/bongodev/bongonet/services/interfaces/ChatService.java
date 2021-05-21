package ru.itis.bongodev.bongonet.services.interfaces;

import ru.itis.bongodev.bongonet.models.Chat;
import ru.itis.bongodev.bongonet.models.Message;

import java.util.List;

public interface ChatService {
    Chat getOrCreateChatByUsersIds(Long senderId, Long recipientId, boolean createIfNotExist);
    List<Chat> getAllChatsByUserId(Long userId);
}
