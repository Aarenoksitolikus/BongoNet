package ru.itis.bongodev.bongonet.services;

import ru.itis.bongodev.bongonet.dto.UserDto;
import ru.itis.bongodev.bongonet.models.Profile;
import ru.itis.bongodev.bongonet.models.User;

import java.util.List;

public interface UsersService {
    List<UserDto> getAllUsers();
    User getUser(String username);
    User getUser(Long id);

    Profile getProfile(Long id);
    void banUser(Long id);
    void updateUser(User user);
    void updateProfile(Profile profile);
}
