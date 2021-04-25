package ru.itis.bongodev.bongonet.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.itis.bongodev.bongonet.models.Post;
import ru.itis.bongodev.bongonet.models.User;

import java.util.List;
import java.util.Optional;

@Repository
public interface UsersRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
    Optional<User> findByConfirmCode(String code);
    List<User> findAllByOrderByUsernameAsc();
}
