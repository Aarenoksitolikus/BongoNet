package ru.itis.bongodev.bongonet.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.itis.bongodev.bongonet.models.FriendRequest;

import java.util.List;
import java.util.Optional;

@Repository
public interface FriendsRepository extends JpaRepository<FriendRequest, Long> {
    List<FriendRequest> findAllBySender_IdOrderBySendTimeDesc(Long id);
    List<FriendRequest> findAllByRecipient_IdOrderBySendTimeDesc(Long id);

    Optional<FriendRequest> findBySender_IdAndRecipient_Id(Long senderId, Long recipientId);
}
