package ru.itis.bongodev.bongonet.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.bongodev.bongonet.dto.ProfileForm;
import ru.itis.bongodev.bongonet.dto.UserDto;
import ru.itis.bongodev.bongonet.models.Profile;
import ru.itis.bongodev.bongonet.models.User;
import ru.itis.bongodev.bongonet.repositories.ProfileRepository;
import ru.itis.bongodev.bongonet.repositories.UsersRepository;

import java.util.List;
import java.util.Optional;

import static ru.itis.bongodev.bongonet.dto.UserDto.*;

@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private ProfileRepository profileRepository;

    @Override
    public List<UserDto> getAllUsers() {
        return from(usersRepository.findAll());
    }

    @Override
    public User getUser(String username) {
        return usersRepository.findByUsername(username).orElse(null);
    }

    @Override
    public Profile getProfile(Long id) {
        return profileRepository.findById(id).orElse(null);
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
    public void updateProfile(ProfileForm form) {
        Optional<Profile> current = profileRepository.findById(form.getId());
        if (current.isPresent()) {
            Profile profile = current.get();
            profile.setFirstName(form.getFirstName());
            profile.setLastName(form.getLastName());
            profile.setBirthday(form.getBirthday());
            profileRepository.save(profile);
        }
    }
}
