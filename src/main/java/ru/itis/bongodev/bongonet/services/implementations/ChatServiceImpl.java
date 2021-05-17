package ru.itis.bongodev.bongonet.services.implementations;

import org.springframework.stereotype.Service;
import ru.itis.bongodev.bongonet.services.interfaces.ChatService;

@Service
public class ChatServiceImpl implements ChatService {
    @Override
    public String getChatId(String senderId, String recipientId, boolean createIfNotExist) {
        return null;
    }
}
