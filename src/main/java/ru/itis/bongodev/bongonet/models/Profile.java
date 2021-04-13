package ru.itis.bongodev.bongonet.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.File;
import java.sql.Date;

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
    private User user;
    private String avatar;
    private String firstName;
    private String lastName;
    private String status;
    private String about;
    private Date birthday;

    @Enumerated(value = EnumType.STRING)
    private Sex sex;

    public enum Sex {
        MALE, FEMALE, UNDEFINED
    }
}
