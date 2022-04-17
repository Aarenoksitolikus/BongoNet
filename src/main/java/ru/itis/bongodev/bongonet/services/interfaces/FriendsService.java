package ru.itis.bongodev.bongonet.services.interfaces;

import ru.itis.bongodev.bongonet.models.Friendship;

import java.util.List;

public interface FriendsService {
    void sendFriendRequest(Friendship request);

    void confirmFriendRequest(Long id);

    void rejectFriendRequest(Long id);

    void cancelFriendRequest(Long id);

    boolean areFriends(Long firstId, Long secondId);

    Friendship getFriendshipByMembersIds(Long firstId, Long secondId);

    Friendship getFriendshipById(Long id);

    List<Friendship> getAllFriendRequestsBySenderId(Long senderId);

    List<Friendship> getAllFriendRequestsByRecipientId(Long recipientId);

    List<Friendship> getAllFriendsByUserId(Long userId);
}
