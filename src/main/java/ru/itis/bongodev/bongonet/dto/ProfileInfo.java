package ru.itis.bongodev.bongonet.dto;

import jdk.jfr.Name;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.itis.bongodev.bongonet.models.Profile;

import java.sql.Date;

@Data
public class ProfileInfo {
    private Long id;
    private String firstName;
    private String lastName;
    private String status;
    private String about;
    private Date birthday;
    private Profile.Sex sex;
}
