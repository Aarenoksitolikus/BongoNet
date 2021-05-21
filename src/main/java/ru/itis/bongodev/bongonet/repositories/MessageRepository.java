package ru.itis.bongodev.bongonet.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.bongodev.bongonet.models.Message;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {
    Long countBySenderIdAndRecipientIdAndState(Long senderId, Long recipientId, Message.State state);

    List<Message> findByChatId(Long chatId);
}
