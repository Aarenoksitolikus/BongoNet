package ru.itis.bongodev.bongonet.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.itis.bongodev.bongonet.models.Post;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@Repository
public interface PostsRepository extends JpaRepository<Post, Long> {
    List<Post> findAllByAuthor_IdOrderByPublicationTimeDesc(Long id);

    List<Post> findAllByAuthor_IdAndPublicationTimeAfterOrderByPublicationTimeDesc(Long id, Timestamp timestamp);
}
