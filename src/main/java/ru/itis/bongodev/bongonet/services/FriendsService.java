package ru.itis.bongodev.bongonet.services;

import ru.itis.bongodev.bongonet.models.FriendRequest;

import java.util.List;

public interface FriendsService {
    void sendFriendRequest(FriendRequest request);
    void confirmFriendRequest(Long id);
    void rejectFriendRequest(Long id);
    List<FriendRequest> getAllFriendRequestsBySenderId(Long senderId);
    List<FriendRequest> getAllFriendRequestsByRecipientId(Long recipientId);
}
