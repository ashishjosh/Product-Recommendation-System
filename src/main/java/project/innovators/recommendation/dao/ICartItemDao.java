package project.innovators.recommendation.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import project.innovators.recommendation.model.Cart;
import project.innovators.recommendation.model.CartItem;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface ICartItemDao extends JpaRepository<CartItem, Long> {
    List<CartItem> findByCart(Cart cart);

    CartItem findCartItemById(Long id);

    @Modifying
    @Transactional
    @Query(value = "update cart_item set quantity = :q where id = :id", nativeQuery = true)
    Integer updateCartForCartWithId(@Param("id") Long cartItemId, @Param("q") Integer quantity);
}
