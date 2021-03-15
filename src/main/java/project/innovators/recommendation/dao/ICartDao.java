package project.innovators.recommendation.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import project.innovators.recommendation.model.Cart;
import project.innovators.recommendation.model.User;

import java.util.List;

@Repository
public interface ICartDao extends CrudRepository<Cart, Long> {
    Cart findCartById(long id);

    List<Cart> findCartByCustomer(User user);
}
