package ru.itis.bongodev.bongonet.dto;

import lombok.Data;
import ru.itis.bongodev.bongonet.models.Profile;

import java.sql.Date;

@Data
public class ProfileForm {
    private String firstName;
    private String lastName;
    private Date birthday;
    private Profile.Sex sex;
}
