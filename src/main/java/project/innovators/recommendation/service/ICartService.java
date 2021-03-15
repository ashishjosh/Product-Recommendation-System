package project.innovators.recommendation.service;

import project.innovators.recommendation.model.Cart;

import java.util.Optional;

public interface ICartService {

    void saveCartToDb(Cart cart);

    Cart findById(long cart_id);

    void update(Cart cart);
}
