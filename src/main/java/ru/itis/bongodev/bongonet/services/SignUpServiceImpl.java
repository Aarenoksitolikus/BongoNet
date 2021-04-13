package ru.itis.bongodev.bongonet.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.itis.bongodev.bongonet.dto.UserForm;
import ru.itis.bongodev.bongonet.models.Profile;
import ru.itis.bongodev.bongonet.models.User;
import ru.itis.bongodev.bongonet.repositories.ProfileRepository;
import ru.itis.bongodev.bongonet.repositories.UsersRepository;
import ru.itis.bongodev.bongonet.utils.EmailUtil;
import ru.itis.bongodev.bongonet.utils.MailsGenerator;

import java.io.File;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Optional;
import java.util.UUID;

@Service
public class SignUpServiceImpl implements SignUpService {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private ProfileRepository profileRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private EmailUtil emailUtil;

    @Autowired
    private MailsGenerator mailsGenerator;

    @Value("${server.url}")
    private String serverUrl;

    @Value("${spring.mail.username}")
    private String from;

    @Override
    public void signUp(UserForm userForm) {
        User newUser = User.builder()
                .username(userForm.getUsername())
                .email(userForm.getEmail())
                .hashPassword(passwordEncoder.encode(userForm.getPassword()))
                .confirmCode(UUID.randomUUID().toString())
                .role(User.Role.GUEST)
                .state(User.State.NOT_CONFIRMED)
                .creationDate(Date.valueOf(LocalDate.now()))
                .build();

        usersRepository.save(newUser);

        String confirmMail = mailsGenerator.getMailForConfirm(serverUrl, newUser.getConfirmCode());
        emailUtil.sendMail(newUser.getEmail(), "Registration", from, confirmMail);
    }

    @Override
    public boolean confirm(String confirmCode) {
        Optional<User> user = usersRepository.findByConfirmCode(confirmCode);

        if (user.isPresent()) {
            User confirmedUser = user.get();
            if (confirmedUser.getState() == User.State.ACTIVE && confirmedUser.getRole() == User.Role.USER) {
                return false;
            }

            Profile newProfile = Profile.builder()
                    .user(confirmedUser)
                    .avatar("images/default-avatar.jpg")
                    .status("Hello! I'm new at BongoNet. Nice to meet you!")
                    .build();

            profileRepository.save(newProfile);

            confirmedUser.setState(User.State.ACTIVE);
            confirmedUser.setRole(User.Role.USER);
            confirmedUser.setProfile(newProfile);

            usersRepository.save(confirmedUser);

            return true;
        }

        return false;
    }
}
