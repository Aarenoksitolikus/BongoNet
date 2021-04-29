package ru.itis.bongodev.bongonet.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.bongodev.bongonet.models.Comment;
import ru.itis.bongodev.bongonet.models.Post;
import ru.itis.bongodev.bongonet.repositories.CommentsRepository;
import ru.itis.bongodev.bongonet.repositories.PostsRepository;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class PostsServiceImpl implements PostsService {

    @Autowired
    private PostsRepository postsRepository;

    @Autowired
    private CommentsRepository commentsRepository;

    @Override
    public List<Post> getAllPostsByUserId(Long id) {
        return postsRepository.findAllByAuthor_IdOrderByPublicationTimeDesc(id);
    }

    @Override
    public void addPost(Post post) {
        post.setPublicationTime(Timestamp.valueOf(LocalDateTime.now()));
        postsRepository.save(post);
    }

    @Override
    public void addComment(Comment comment) {
        comment.setPublicationTime(Timestamp.valueOf(LocalDateTime.now()));
        commentsRepository.save(comment);
    }

    @Override
    public Post getPostById(Long id) {
        return postsRepository.findById(id).orElse(null);
    }
}
