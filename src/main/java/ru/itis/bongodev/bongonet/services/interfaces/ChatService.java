package ru.itis.bongodev.bongonet.services.interfaces;

import ru.itis.bongodev.bongonet.models.Chat;

public interface ChatService {
    Chat getOrCreateChatByUsersIds(String senderId, String recipientId, boolean createIfNotExist);
}
