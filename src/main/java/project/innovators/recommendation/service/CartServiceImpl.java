package project.innovators.recommendation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.innovators.recommendation.dao.ICartDao;
import project.innovators.recommendation.model.Cart;

import java.util.Optional;

@Service
public class CartServiceImpl implements ICartService {

    @Autowired
    private ICartDao cartDao;

    @Override
    public void saveCartToDb(Cart cart) {
        cartDao.save(cart);
    }

    @Override
    public Cart findById(long id) {
        return cartDao.findCartById(id);
    }

    @Override
    public void update(Cart cart) {
        cartDao.save(cart);
    }


}
