package ru.itis.bongodev.bongonet.services.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.bongodev.bongonet.models.Friendship;
import ru.itis.bongodev.bongonet.repositories.FriendsRepository;
import ru.itis.bongodev.bongonet.services.interfaces.FriendsService;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class FriendsServiceJpaImpl implements FriendsService {

    @Autowired
    private FriendsRepository friendsRepository;

    @Override
    public void sendFriendRequest(Friendship request) {
        var senderId = request.getSender().getId();
        var recipientId = request.getRecipient().getId();
        if (friendsRepository.findBySender_IdAndRecipient_Id(senderId, recipientId).isEmpty()
                && friendsRepository.findBySender_IdAndRecipient_Id(recipientId, senderId).isEmpty()) {
            request.setSendTime(Timestamp.valueOf(LocalDateTime.now()));
            request.setState(Friendship.State.NOT_CONFIRMED);
            friendsRepository.save(request);
        }
    }

    @Override
    public void confirmFriendRequest(Long id) {
        friendsRepository.findById(id).ifPresent(value -> {
            value.setState(Friendship.State.CONFIRMED);
            value.setConfirmTime(Timestamp.valueOf(LocalDateTime.now()));
            friendsRepository.save(value);
        });
    }

    @Override
    public void rejectFriendRequest(Long id) {
        friendsRepository.findById(id).ifPresent(value -> {
            value.setState(Friendship.State.REJECTED);
            friendsRepository.save(value);
        });
    }

    @Override
    public void cancelFriendRequest(Long id) {
        friendsRepository.findById(id).ifPresent(value -> friendsRepository.delete(value));
    }

    @Override
    public boolean areFriends(Long firstId, Long secondId) {
        boolean result = friendsRepository.findBySender_IdAndRecipient_Id(firstId, secondId).isPresent();
        if (!result) result = friendsRepository.findBySender_IdAndRecipient_Id(secondId, firstId).isPresent();
        return result;
    }

    @Override
    public Friendship getFriendshipByMembersIds(Long firstId, Long secondId) {
        Optional<Friendship> result = friendsRepository.findBySender_IdAndRecipient_Id(firstId, secondId);
        if (result.isEmpty()) {
            result = friendsRepository.findBySender_IdAndRecipient_Id(secondId, firstId);
            if (result.isEmpty()) {
                return null;
            }
            return result.get();
        }
        return result.get();
    }

    @Override
    public Friendship getFriendshipById(Long id) {
        return friendsRepository.findById(id).orElse(null);
    }

    @Override
    public List<Friendship> getAllFriendRequestsBySenderId(Long senderId) {
        return friendsRepository.findAllBySender_IdAndStateEqualsOrderBySendTimeDesc(senderId, Friendship.State.NOT_CONFIRMED);
    }

    @Override
    public List<Friendship> getAllFriendRequestsByRecipientId(Long recipientId) {
        return friendsRepository.findAllByRecipient_IdAndStateEqualsOrderBySendTimeDesc(recipientId, Friendship.State.NOT_CONFIRMED);
    }

    @Override
    public List<Friendship> getAllFriendsByUserId(Long userId) {
        return friendsRepository.findAllBySender_IdAndStateEqualsOrRecipient_IdAndStateEqualsOrderByConfirmTimeDesc(userId, Friendship.State.CONFIRMED, userId, Friendship.State.CONFIRMED);
    }
}
