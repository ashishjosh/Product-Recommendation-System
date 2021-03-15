package project.innovators.recommendation.service;

import project.innovators.recommendation.model.Cart;
import project.innovators.recommendation.model.CartItem;

import java.util.List;

public interface ICartItemService {
    long addCartItem(CartItem cartItem);
    long removeCartItem(CartItem cartItem);

    void save(CartItem cartItem);

    List<CartItem> findByCart(Cart cart);

    void deleteById(Long cartItemId);

    Integer updateQuantityForCartWithId(Long cartItemId, Integer quantity);

    CartItem findById(Long id);
}
