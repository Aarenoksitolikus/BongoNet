package ru.itis.bongodev.bongonet.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.bongodev.bongonet.models.FriendRequest;
import ru.itis.bongodev.bongonet.repositories.FriendsRepository;
import ru.itis.bongodev.bongonet.repositories.UsersRepository;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

@Service
public class FriendsServiceImpl implements FriendsService {

    @Autowired
    private FriendsRepository friendsRepository;

    @Autowired
    private UsersRepository usersRepository;

    @Override
    public void sendFriendRequest(FriendRequest request) {
        var senderId = request.getSender().getId();
        var recipientId = request.getRecipient().getId();
        if (friendsRepository.findBySender_IdAndRecipient_Id(senderId, recipientId).isEmpty()
                && friendsRepository.findBySender_IdAndRecipient_Id(recipientId, senderId).isEmpty()) {
            request.setSendTime(Timestamp.valueOf(LocalDateTime.now()));
            request.setState(FriendRequest.State.NOT_CONFIRMED);
            friendsRepository.save(request);
        }
    }

    @Override
    public void confirmFriendRequest(Long id) {
        getRequest(id).setState(FriendRequest.State.CONFIRMED);
    }

    @Override
    public void rejectFriendRequest(Long id) {
        getRequest(id).setState(FriendRequest.State.REJECTED);
    }

    @Override
    public List<FriendRequest> getAllFriendRequestsBySenderId(Long senderId) {
        return friendsRepository.findAllBySender_IdOrderBySendTimeDesc(senderId);
    }

    @Override
    public List<FriendRequest> getAllFriendRequestsByRecipientId(Long recipientId) {
        return friendsRepository.findAllByRecipient_IdOrderBySendTimeDesc(recipientId);
    }


    private FriendRequest getRequest(Long id) {
        var currentRequest = friendsRepository.findById(id).orElse(null);
//        var sender = usersRepository.findById(Objects.requireNonNull(currentRequest).getSender().getId()).orElse(null);
//        var recipient = usersRepository.findById(currentRequest.getRecipient().getId()).orElse(null);
        friendsRepository.delete(Objects.requireNonNull(currentRequest));
        return currentRequest;
    }
}
