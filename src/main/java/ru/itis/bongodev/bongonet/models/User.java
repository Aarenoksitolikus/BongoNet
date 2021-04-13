package ru.itis.bongodev.bongonet.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "account")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    private String username;
    private String email;
    private String hashPassword;
    private String confirmCode;
    private Date creationDate;

    @OneToOne(mappedBy = "user", cascade = CascadeType.MERGE)
    @PrimaryKeyJoinColumn
    private Profile profile;

    @Enumerated(value = EnumType.STRING)
    private State state;

    @Enumerated(value = EnumType.STRING)
    private Role role;

    @OneToMany(mappedBy = "author")
    private List<Post> posts;

    public boolean isActive() {
        return this.state == State.ACTIVE;
    }

    public boolean isBanned() {
        return this.state == State.BANNED;
    }

    public boolean isAdmin() {
        return this.role == Role.ADMIN;
    }

    public enum State {
        ACTIVE, BANNED, DELETED, NOT_CONFIRMED
    }

    public enum Role {
        GUEST, USER, ADMIN
    }
}
