package ru.itis.bongodev.bongonet.services.implementations;

import org.springframework.stereotype.Service;
import ru.itis.bongodev.bongonet.models.Message;
import ru.itis.bongodev.bongonet.services.interfaces.MessageService;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    @Override
    public Message save(Message message) {
        return null;
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
