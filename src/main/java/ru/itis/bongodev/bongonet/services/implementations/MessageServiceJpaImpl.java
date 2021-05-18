package ru.itis.bongodev.bongonet.services.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.bongodev.bongonet.models.Message;
import ru.itis.bongodev.bongonet.repositories.MessageRepository;
import ru.itis.bongodev.bongonet.services.interfaces.MessageService;

import java.util.List;

@Service
public class MessageServiceJpaImpl implements MessageService {

    @Autowired
    private MessageRepository messageRepository;

    @Override
    public Message save(Message message) {
        return messageRepository.save(message);
    }

    @Override
    public Long countNewMessages(String senderId, String recipientId) {
        return null;
    }

    @Override
    public List<Message> findMessages(String senderId, String recipientId) {
        return null;
    }

    @Override
    public Message findById(Long id) {
        return null;
    }

    @Override
    public void updateStates(String senderId, String recipientId, Message.State state) {

    }
}
