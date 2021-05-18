package ru.itis.bongodev.bongonet.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String senderId;
    private String recipientId;
    private String senderUsername;
    private String recipientUsername;
    private String content;
    private Timestamp sendDate;

    @Enumerated(value = EnumType.STRING)
    private State state;

    @ManyToOne
    @JoinColumn(name = "chat_id")
    private Chat chat;

    public enum State {
        RECEIVED, DELIVERED
    }
}
