package ru.itis.bongodev.bongonet.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.itis.bongodev.bongonet.models.Profile;

import java.util.Optional;

@Repository
public interface ProfilesRepository extends JpaRepository<Profile, Long> {
    Optional<Profile> findById(Long id);
}
