package ru.itis.bongodev.bongonet.services.interfaces;

import ru.itis.bongodev.bongonet.models.Message;

import java.util.List;

public interface MessageService {
    Message save(Message message);
    Long countNewMessages(String senderId, String recipientId);
    List<Message> findMessages(String senderId, String recipientId);
    Message findById(Long id);
    void updateStates(String senderId, String recipientId, Message.State state);
}
