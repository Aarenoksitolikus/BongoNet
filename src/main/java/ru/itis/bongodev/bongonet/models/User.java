package ru.itis.bongodev.bongonet.models;

import lombok.*;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;

@Getter
@Setter
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
    private String avatar;

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    @PrimaryKeyJoinColumn
    @Setter(AccessLevel.NONE)
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

    public boolean isDeleted() {
        return this.state == State.DELETED;
    }

    public enum State {
        ACTIVE, BANNED, DELETED, NOT_CONFIRMED
    }

    public enum Role {
        GUEST, USER, ADMIN
    }

    public void setProfile(Profile profile) {
        updateProfile(profile, true);
    }

    void updateProfile(Profile profile, boolean set) {
        if (profile != null) {
            this.profile = profile;
            if (set) {
                profile.updateUser(this, false);
            }
        }
    }
}
