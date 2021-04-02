package ru.itis.bongodev.bongonet.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.bongodev.bongonet.dto.UserDto;
import ru.itis.bongodev.bongonet.repositories.UsersRepository;

import java.util.List;

import static ru.itis.bongodev.bongonet.dto.UserDto.*;

@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersRepository usersRepository;

    @Override
    public List<UserDto> getAllUsers() {
        return from(usersRepository.findAll());
    }
}
