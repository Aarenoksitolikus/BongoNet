package ru.itis.bongodev.bongonet.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.File;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Profile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @MapsId
    @JoinColumn(name = "user_id")
    private User user;
    private File avatar;
    private String firstName;
    private String lastName;
    private String status;
    private String about;
    private Integer age;

    @Enumerated(value = EnumType.STRING)
    private Sex sex;

    private enum Sex {
        MALE, FEMALE, UNDEFINED
    }
}
