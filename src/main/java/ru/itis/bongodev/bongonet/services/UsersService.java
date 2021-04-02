package ru.itis.bongodev.bongonet.services;

import ru.itis.bongodev.bongonet.dto.UserDto;

import java.util.List;

public interface UsersService {
    List<UserDto> getAllUsers();
}
