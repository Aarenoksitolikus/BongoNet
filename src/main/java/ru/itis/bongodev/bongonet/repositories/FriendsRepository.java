package ru.itis.bongodev.bongonet.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.itis.bongodev.bongonet.models.Friendship;

import java.util.List;
import java.util.Optional;

@Repository
public interface FriendsRepository extends JpaRepository<Friendship, Long> {
    List<Friendship> findAllBySender_IdAndStateEqualsOrderBySendTimeDesc(Long id, Friendship.State state);
    List<Friendship> findAllByRecipient_IdAndStateEqualsOrderBySendTimeDesc(Long id, Friendship.State state);
    List<Friendship> findAllBySender_IdAndStateEqualsOrRecipient_IdAndStateEqualsOrderByConfirmTimeDesc(Long sender_id, Friendship.State state, Long recipient_id, Friendship.State state2);

    Optional<Friendship> findBySender_IdAndRecipient_Id(Long senderId, Long recipientId);
}
