package ru.itis.bongodev.bongonet.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.bongodev.bongonet.models.Comment;
import ru.itis.bongodev.bongonet.models.Post;
import ru.itis.bongodev.bongonet.models.Profile;
import ru.itis.bongodev.bongonet.models.User;
import ru.itis.bongodev.bongonet.security.details.UserDetailsImpl;
import ru.itis.bongodev.bongonet.services.PostsService;
import ru.itis.bongodev.bongonet.services.UsersService;

import java.io.File;

@Controller
public class ProfileController {

    @Autowired
    private UsersService usersService;

    @Autowired
    private PostsService postsService;

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/profile/me")
    public String getMyProfilePage(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        return "redirect:/profile/" + userDetails.getUsername();
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/profile/{user-username}")
    public String getProfilePage(@AuthenticationPrincipal UserDetailsImpl userDetails,
                                 @PathVariable("user-username") String userUsername,
                                 Model model) {
        var user = usersService.getUser(userUsername);
        var me = user.getUsername().equals(userDetails.getUsername());
        if (me) {
            model.addAttribute("me", true);
            if (user.getRole() == User.Role.ADMIN) {
                model.addAttribute("admin", true);
            }
        }
        model.addAttribute("user", user);
        var profile = user.getProfile();
        if (profile == null) {
            profile = new Profile(user);
            user.setProfile(profile);
            if (me) {
                usersService.updateUser(user);
            }
        }
        model.addAttribute("profile", profile);
        model.addAttribute("posts", postsService.getAllPostsByUserId(user.getId()));
        return "profile_page";
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/profile/settings")
    public String getSettingsPage(@AuthenticationPrincipal UserDetailsImpl userDetails, Model model) {
        var user = getUser(userDetails, model);
        if (user != null) {
            var profile = user.getProfile();
            model.addAttribute("profile", profile);
        }
        return "settings_page";
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/profile/settings")
    public String changeProfile(@AuthenticationPrincipal UserDetailsImpl userDetails, Profile profile) {
        profile.setId(userDetails.getUser().getId());
        usersService.updateProfile(profile);
        return "redirect:/profile/" + userDetails.getUsername();
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/profile/add/post")
    public String addPost(@AuthenticationPrincipal UserDetailsImpl userDetails, Post post) {
        if (!post.getContent().equals("")) {
            post.setAuthor(userDetails.getUser());
            postsService.addPost(post);
        }
        return "redirect:/profile/me";
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/profile/{user-username}/add/comment/{post-id}")
    public String addComment(@AuthenticationPrincipal UserDetailsImpl userDetails, Comment comment,
                             @PathVariable("post-id") Long postId, @PathVariable("user-username") String userUsername) {
        System.out.println(comment);
        if (comment.getContent() != null && !comment.getContent().equals("")) {
            comment.setAuthor(userDetails.getUser());
            comment.setPost(postsService.getPostById(postId));
            postsService.addComment(comment);
        }
        return "redirect:/profile/" + userUsername;
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/profile/settings/avatar")
    public void changeAvatar(@AuthenticationPrincipal UserDetailsImpl userDetails, File avatar) {
    }

    private User getUser(UserDetailsImpl userDetails, Model model) {
        var result = usersService.getUser(userDetails.getUsername());
        model.addAttribute("user", result);
        return result;
    }
}
