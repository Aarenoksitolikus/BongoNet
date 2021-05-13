package ru.itis.bongodev.bongonet.models;

import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Friendship {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "sender_id")
    private User sender;

    @ManyToOne
    @JoinColumn(name = "recipient_id")
    private User recipient;

    @Enumerated(value = EnumType.STRING)
    private State state;
    private Timestamp sendTime;
    private Timestamp confirmTime;

    public enum State {
        NOT_CONFIRMED, CONFIRMED, REJECTED
    }

    @Override
    public String toString() {
        return "FriendRequest{" +
                "sender=" + sender.getUsername() +
                ", recipient=" + recipient.getUsername() +
                ", state=" + state +
                ", sendTime=" + sendTime +
                '}';
    }
}
