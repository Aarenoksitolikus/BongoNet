package ru.itis.bongodev.bongonet.services.interfaces;

public interface ChatService {
    String getChatId(String senderId, String recipientId, boolean createIfNotExist);
}
