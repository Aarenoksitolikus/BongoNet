package ru.itis.bongodev.bongonet.services.interfaces;

import ru.itis.bongodev.bongonet.models.Message;

import java.util.List;

public interface MessageService {
    Message save(Message message);

    Long countNewMessages(Long senderId, Long recipientId);

    List<Message> findMessages(Long senderId, Long recipientId);

    Message findById(Long id);

    void updateStates(Long senderId, Long recipientId, Message.State state);
}
