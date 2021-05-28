package ru.itis.bongodev.bongonet.services.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ru.itis.bongodev.bongonet.dto.ProfileInfo;
import ru.itis.bongodev.bongonet.dto.UserDto;
import ru.itis.bongodev.bongonet.models.Profile;
import ru.itis.bongodev.bongonet.models.User;
import ru.itis.bongodev.bongonet.repositories.ProfilesRepository;
import ru.itis.bongodev.bongonet.repositories.UsersRepository;
import ru.itis.bongodev.bongonet.services.interfaces.UsersService;
import ru.itis.bongodev.bongonet.utils.FileDownloader;

import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static ru.itis.bongodev.bongonet.dto.UserDto.*;

@Service
public class UsersServiceJpaImpl implements UsersService {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private ProfilesRepository profilesRepository;

    @Autowired
    private FileDownloader fileDownloader;

    @Value("${files.download.path}")
    private String uploadPath;

    @Value("${files.download.path.short}")
    private String uploadPathShort;

    @Override
    public List<UserDto> getAllUsersDto() {
        return from(usersRepository.findAllByOrderByUsernameAsc());
    }

    @Override
    public List<User> getAllUsers() {
        return usersRepository.findAllByOrderByUsernameAsc();
    }

    @Override
    public User getUser(String username) {
        return usersRepository.findByUsername(username).orElse(null);
    }

    @Override
    public User getUserByEmail(String email) {
        return usersRepository.findByEmail(email).orElse(null);
    }

    @Override
    public User getUser(Long id) {
        return usersRepository.findById(id).orElse(null);
    }

    @Override
    public Timestamp getLastSeenByUsername(String username) {
        return usersRepository.lastSeen(username);
    }

    @Override
    public Profile getProfile(Long id) {
        return profilesRepository.findById(id).orElse(null);
    }

    @Override
    public void banUser(Long id) {
        Optional<User> user = usersRepository.findById(id);
        if (user.isPresent()) {
            User bannedUser = user.get();
            if (bannedUser.isBanned()) {
                bannedUser.setState(User.State.ACTIVE);
            } else {
                bannedUser.setState(User.State.BANNED);
            }
            usersRepository.save(bannedUser);
        }
    }

    @Override
    public void updateUser(User user) {
        Optional<User> current = usersRepository.findById(user.getId());
        if (current.isPresent()) {
            usersRepository.save(user);
        }
    }

    @Override
    public void updateProfile(ProfileInfo info) {
        Optional<Profile> current = profilesRepository.findById(info.getId());
        if (current.isPresent()) {
            Profile currentProfile = current.get();
            currentProfile.setFirstName(info.getFirstName());
            currentProfile.setLastName(info.getLastName());
            currentProfile.setAbout(info.getAbout());
            currentProfile.setBirthday(info.getBirthday());
            currentProfile.setStatus(info.getStatus());
            currentProfile.setSex(info.getSex());
            profilesRepository.save(currentProfile);
        }
    }

    @Override
    public void changeAvatar(Long id, MultipartFile avatar) {
        String fileName = UUID.randomUUID().toString() + "-" + avatar.getOriginalFilename();
        fileDownloader.download(avatar, uploadPath, fileName);
        var current = getUser(id);
        current.setAvatar(uploadPathShort + "/" + fileName);
        usersRepository.save(current);

        System.out.println("from service: " + uploadPathShort);
    }
}
