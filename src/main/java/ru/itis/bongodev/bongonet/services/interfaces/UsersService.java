package ru.itis.bongodev.bongonet.services.interfaces;

import ru.itis.bongodev.bongonet.dto.ProfileInfo;
import ru.itis.bongodev.bongonet.dto.UserDto;
import ru.itis.bongodev.bongonet.models.Profile;
import ru.itis.bongodev.bongonet.models.User;

import java.sql.Timestamp;
import java.util.List;

public interface UsersService {
    List<UserDto> getAllUsersDto();
    List<User> getAllUsers();
    User getUser(String username);
    User getUser(Long id);

    Timestamp getLastSeenByUsername(String username);
    Profile getProfile(Long id);
    void banUser(Long id);
    void updateUser(User user);
    void updateProfile(ProfileInfo profileInfo);
}
