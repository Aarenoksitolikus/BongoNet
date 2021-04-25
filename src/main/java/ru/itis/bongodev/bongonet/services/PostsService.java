package ru.itis.bongodev.bongonet.services;

import ru.itis.bongodev.bongonet.models.Comment;
import ru.itis.bongodev.bongonet.models.Post;

import java.util.List;

public interface PostsService {
    List<Post> getAllPostsByUserId(Long id);
    void addPost(Post post);
    void addComment(Comment comment);
    Post getPostById(Long id);
}
