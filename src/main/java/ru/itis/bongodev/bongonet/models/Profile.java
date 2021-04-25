package ru.itis.bongodev.bongonet.models;

import lombok.*;

import javax.persistence.*;
import java.sql.Date;

//@Getter
//@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Profile {
    @Id
    @Column(name = "user_id")
    private Long id;

    @OneToOne
    @MapsId
    @JoinColumn(name = "user_id")
    @Setter(AccessLevel.NONE)
    private User user;
    private String avatar;
    private String firstName;
    private String lastName;
    private String status;
    private String about;
    private Date birthday;

    public void setUser(User user) {
        updateUser(user, true);
    }

    void updateUser(User user, boolean set) {
        this.user = user;
        if (user != null && set) {
            user.updateProfile(this, false);
        }
    }

    public Profile(User user) {
        this.user = user;
    }
}
