package ru.itis.bongodev.bongonet.services.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.bongodev.bongonet.models.Message;
import ru.itis.bongodev.bongonet.repositories.ChatRepository;
import ru.itis.bongodev.bongonet.repositories.MessageRepository;
import ru.itis.bongodev.bongonet.services.interfaces.MessageService;

import java.util.List;

@Service
public class MessageServiceJpaImpl implements MessageService {

    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private ChatRepository chatRepository;

    @Override
    public Message save(Message message) {
        return messageRepository.save(message);
    }

    @Override
    public Long countNewMessages(Long senderId, Long recipientId) {
        return messageRepository.countBySenderIdAndRecipientIdAndState(senderId, recipientId, Message.State.RECEIVED);
    }

    @Override
    public List<Message> findMessages(Long senderId, Long recipientId) {
        var chat = chatRepository.findBySenderIdAndRecipientId(senderId, recipientId);
        Long id = null;
        if (chat.isPresent()) {
            id = chat.get().getId();
        }
        return messageRepository.findByChatId(id);
    }

    @Override
    public Message findById(Long id) {
        return messageRepository.findById(id).orElse(null);
    }

    @Override
    public void updateStates(Long senderId, Long recipientId, Message.State state) {

    }
}
