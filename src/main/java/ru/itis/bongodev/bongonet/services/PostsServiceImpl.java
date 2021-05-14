package ru.itis.bongodev.bongonet.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.bongodev.bongonet.models.Comment;
import ru.itis.bongodev.bongonet.models.Friendship;
import ru.itis.bongodev.bongonet.models.Post;
import ru.itis.bongodev.bongonet.repositories.CommentsRepository;
import ru.itis.bongodev.bongonet.repositories.PostsRepository;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@Service
public class PostsServiceImpl implements PostsService {

    @Autowired
    private PostsRepository postsRepository;

    @Autowired
    private CommentsRepository commentsRepository;

    @Autowired
    private FriendsService friendsService;

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
    public void deletePost(Long id) {
        postsRepository.findById(id).ifPresent(post -> postsRepository.delete(post));
    }

    @Override
    public void addComment(Comment comment) {
        comment.setPublicationTime(Timestamp.valueOf(LocalDateTime.now()));
        commentsRepository.save(comment);
    }

    @Override
    public void deleteComment(Long id) {
        commentsRepository.findById(id).ifPresent(comment -> commentsRepository.delete(comment));
    }

    @Override
    public Post getPostById(Long id) {
        return postsRepository.findById(id).orElse(null);
    }

    @Override
    public Comment getCommentById(Long id) {
        return commentsRepository.findById(id).orElse(null);
    }

    @Override
    public List<Post> getNewsForUserById(Long id) {
        List<Post> result = new ArrayList<>();
        List<Friendship> friends = friendsService.getAllFriendsByUserId(id);
        if (friends.size() > 0) {
            for (Friendship current : friends) {
                Long currentId;
                if (current.getSender().getId().equals(id)) {
                    currentId = current.getRecipient().getId();
                } else {
                    currentId = current.getSender().getId();
                }
                if (currentId != null) {
                    result.addAll(postsRepository.findAllByAuthor_IdAndPublicationTimeAfterOrderByPublicationTimeDesc(currentId, Timestamp.valueOf(LocalDateTime.now().minusDays(2))));
                }
            }
            result.sort(Comparator.comparing(Post::getPublicationTime).reversed());
        }
        return result;
    }
}
