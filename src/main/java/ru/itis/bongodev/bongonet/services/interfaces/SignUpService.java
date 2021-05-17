package ru.itis.bongodev.bongonet.services.interfaces;

import ru.itis.bongodev.bongonet.dto.UserForm;

public interface SignUpService {
    void signUp(UserForm userForm);
    boolean confirm(String confirmCode);
}
