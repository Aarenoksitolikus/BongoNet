package ru.itis.bongodev.bongonet.services.interfaces;

import org.springframework.web.multipart.MultipartFile;
import ru.itis.bongodev.bongonet.dto.ProfileInfo;
import ru.itis.bongodev.bongonet.dto.UserDto;
import ru.itis.bongodev.bongonet.models.Profile;
import ru.itis.bongodev.bongonet.models.User;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

public interface UsersService {
    List<UserDto> getAllUsersDto();
    List<User> getAllUsers();
    User getUser(String username);
    User getUserByEmail(String email);
    User getUser(Long id);

    Profile getProfile(Long id);
    void banUser(Long id);
    void updateUser(User user);
    void updateProfile(ProfileInfo profileInfo);
    void changeAvatar(Long id, String avatarUrl);
}
