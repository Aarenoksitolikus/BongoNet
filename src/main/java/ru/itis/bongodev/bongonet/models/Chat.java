package ru.itis.bongodev.bongonet.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Chat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String senderId, recipientId;

    @OneToMany(mappedBy = "chat", fetch = FetchType.EAGER)
    private List<Message> messages;
}
